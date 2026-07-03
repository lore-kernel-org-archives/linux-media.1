Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0936F220F2A;
	Fri,  3 Jul 2026 02:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783046863; cv=none; b=RWWEyqp7WTI9G5ffnUx2ugTEIw2RNBrTNaE74Wla5v4Tynhljta2bGP1Q6UKT8MvsrzuGIOFPA2d+sEHUl6sR0vim7ollFIrtjaq9mgVMOWDlw502WzzLhw3VNY9iZf5LR/VdR7fnl+xJOFvHDMUqSNwssVII/H8Oo5m3TFzgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783046863; c=relaxed/simple;
	bh=9JEWyxWRiC13IpLeNhZrA77xBCgEWHinl/sEO0s42k0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nbIdH7T9zlhOmcL69hRHVLTTkE2/nM9jg0E73ADzH3hQgq4+Q0i3EFquPuepnsx0ulWx8OccEZfa/XCi+abhuxyWQ2vaY6b5GEZ7CN2gk7LwY5Fl8XNp6MxiN29oympAgWLvfwD8/g8ImhFQN/gNgcIb5SdIVnfeWbUGeMLOFt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lomK1nAa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lomK1nAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783046861; x=1814582861;
  h=date:from:to:cc:subject:message-id;
  bh=9JEWyxWRiC13IpLeNhZrA77xBCgEWHinl/sEO0s42k0=;
  b=lomK1nAaNN1HwJ2bJbpAYA1VC0FD3oqpOL2gUTRF0OdUwoEEhltABVhH
   iulgdYRaVQ6BTD976B0S7g9zzeTDoVplGP5uDdq5I7+/CNslp2nD8075B
   rcW1VtY5ntCgMivX5HyHMskexJ/jaX5MM8PXINuypzQqSiLXndTbmEgt3
   EoCI29I8Tix3cfZoZ0OQr8oemqt0O4Em6NHRYkbpjHWDjw7HM1sobc/hB
   hN8m/0ggq/zpS/FJA9HIIrumYczlZ4+18mqqYBDMGTT+kDA4uDw6QnQn9
   qnYsFmQ2rq1X89WbILFWwQA5i6WjxohHMMRoXik3wzryirdkA3NkJYHMC
   w==;
X-CSE-ConnectionGUID: vgM1fjNySruIdURrSovQzw==
X-CSE-MsgGUID: VIfOPUePS2mNhlWSi/u91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86343516"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86343516"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:47:41 -0700
X-CSE-ConnectionGUID: N/c+/s6cTvmSoEXCrP5QSA==
X-CSE-MsgGUID: 8g5s9xz4TDK9WAM+F5XYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="246624889"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2026 19:47:28 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfTw6-000000001PR-11Hg;
	Fri, 03 Jul 2026 02:47:26 +0000
Date: Fri, 03 Jul 2026 04:46:57 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 40/105] htmldocs:
 Documentation/userspace-api/media/v4l/subdev-config-model.rst:6: WARNING:
 duplicate label media_subdev_config_model, other instance in
 Documentation/userspace-api/media/v4l/dev-subdev.rst
Message-ID: <202607030440.6z1mIuUi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   a6d4ce993bcd76851cfc7f28cc33aac011a30fa9
commit: 00eae8b12e8fecc8c859a4195cd7a86675467689 [40/105] media: Documentation: Add subdev configuration models, raw sensor model
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260703/202607030440.6z1mIuUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030440.6z1mIuUi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/userspace-api/media/v4l/subdev-config-model.rst:6: WARNING: duplicate label media_subdev_config_model, other instance in Documentation/userspace-api/media/v4l/dev-subdev.rst
>> Documentation/userspace-api/media/v4l/subdev-config-model.rst:35: WARNING: duplicate label media_subdev_config_model_common_raw_sensor, other instance in Documentation/userspace-api/media/v4l/dev-subdev.rst
>> Documentation/userspace-api/media/v4l/subdev-config-model.rst:: WARNING: duplicate label media_subdev_config_model_common_raw_sensor_subdev, other instance in Documentation/userspace-api/media/v4l/dev-subdev.rst
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
   Documentation/userspace-api/media/drivers/camera-sensor.rst:147: WARNING: undefined label: 'media-metadata-layout-ccs' [ref.ref]


vim +6 Documentation/userspace-api/media/v4l/subdev-config-model.rst

     4	
     5	Sub-device configuration models
   > 6	===============================
     7	
     8	The V4L2 specification defines a subdev API that exposes three type of
     9	configuration elements: formats, selection rectangles and controls. The
    10	specification contains generic information about how those configuration
    11	elements behave, but not precisely how they apply to particular hardware
    12	features. We leave some leeway to drivers to decide how to map selection
    13	rectangles to device features, as long as they comply with the V4L2
    14	specification. This is needed as hardware features differ between devices, so
    15	it's the driver's responsibility to handle this mapping.
    16	
    17	Unfortunately, this lack of clearly defined mapping in the specification has led
    18	to different drivers mapping the same hardware features to different API
    19	elements, or implementing the API elements with slightly different
    20	behaviours. Furthermore, many drivers have implemented selection rectangles in
    21	ways that do not comply with the V4L2 specification. All of this makes userspace
    22	development difficult.
    23	
    24	Sub-device configuration models specify in detail what the user space can expect
    25	from a sub-device in terms of V4L2 sub-device interface support, semantics
    26	included.
    27	
    28	A sub-device may implement more than one configuration model at the same
    29	time. The implemented configuration models can be obtained from the sub-device's
    30	``V4L2_CID_CONFIG_MODEL`` control.
    31	
    32	.. _media_subdev_config_model_common_raw_sensor:
    33	
    34	Common raw camera sensor model
  > 35	------------------------------
    36	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
