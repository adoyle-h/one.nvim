return function(One)
	local util = One.util
	local impatient = One.CM.config.impatient

	if impatient.enable then
		local isNew = util.ensurePkg { --
			url = impatient.src,
			dist = impatient.dist,
		}

		if isNew then util.packadd(impatient.dist) end

		_G.__luacache_config = { --
			chunks = impatient.chunks,
			modpaths = impatient.modpaths,
		}

		require(impatient.pkgName)
	end
end
