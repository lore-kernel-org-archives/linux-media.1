Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826655;
	b=Tqe2HsZQtSQKFDjWQi4qsqc+orA8tTI2dmZZQVgM+cViP3cHUce6QgfjdpFaLtZ+uMfb
	 GDcT4m2SxH3f8Ker5JonWEv4N773oBPonaZeH1mOQef8Ii+DkxoLmi56nojt72lpo5LHd
	 M+byvtjFNAqIVuQjYaykXG3Eo4EPFKuQQTnt0TkPnElz8bvoaAwxWSy6dkQ/W4kR5/YMT
	 cZBEVf7tykUKRHgkqDAgfFM/cct+vZEDkwrNSBg7BnLhOOgCuIvBpFAqVNOXh0boymGO2
	 uRCKqx3JUX/s2Iq9bkDsLC7gbhEuQMtEHipmQFlBrUeanppzut/iCBdFUpPAuJG1N8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826655;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ctlHt2JLaIfhdJqip8B29uE4209TAh6ZSBNTqgalats=;
	b=KNj9eX4p4S6OPmAVqNaBF2FI6B/KgbX3GsdmFY/4HIggPqxej/TuDvbU0kpvB2MmN4SA
	 cMOEauqwYPKSy8stwpXtD3pgXQ0nqTo97XmWuroyyjG1FC1uk3/bCM9ve5RPpsODLFkDi
	 vL0M6CgBDMgooAD8YG9u4rLoAYAhsCDDPzh5hNm16917/R+9HVoXjk5mKBbCsKV6gLQw/
	 Wy8lHGgBVq6q/SyiFcCQWwSEYIiX5l9OfdHRNsBr+07BtoCCdlRQYOfON0D+F6/D4aOTm
	 c7bKxiO7VRAsZyPW4f/U1yDVmVi6hWmZ3QxK3ySAcWSp/gQamHx7no+y/T9bUC+DsBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dUL1TbNK;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F8606A324;
	Sat, 28 Nov 2026 00:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814F8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dUL1TbNK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795826654; x=1827362654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jnEq3ovZP6cM1oJUZcdyFoF/mxkTAfO3qY5KxdsrpDQ=;
  b=dUL1TbNKaSYqplYMJoa59V/omukcgOOs6dFLo2SsRqF7Z4QDbZoJFJM3
   ghE0hC/WnMs8xk67I7KIhbg8iqzIY+O/KvkayGwhcsm/c6LY/7PvqkRdh
   WtgwZUxaD1kBBhPFRuM0x1ZRnasoG7u09X584HQ9j9yrswYYB7bnHzzTc
   dMG48b4ZoYYmsPYdvwGC0Vrf78b4y9EveCecar6Zig/bvlaepLbgRS5mp
   FHnehGnXq/iZ/BpmJlm4WTg9f1d5LPzsoMocxv2xPEYZ+SIfzi/c5Qi5P
   thDHDTRPDGA7Mv35BD3ad+QmjXEZO/0ZkckPtAxQCy+Le8d6Akn50UwPw
   g==;
X-CSE-ConnectionGUID: Ay/LmSQhSDe0n29Bf3BMuA==
X-CSE-MsgGUID: YLmWf3A+RnW75pZLCj9HBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4739372"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4739372"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 16:44:14 -0800
X-CSE-ConnectionGUID: UyqdbBtAQRuPeqKB5NLzuQ==
X-CSE-MsgGUID: IhKfo2BlQn665SiqLkNS2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="14508775"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 27 Nov 2026 16:44:10 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX6Xv-000000000Ss-2ZRS;
	Sat, 28 Nov 2026 00:44:07 +0000
Date: Sat, 28 Nov 2026 01:43:51 +0100
From: kernel test robot <lkp@intel.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev,
	Anthony McGivern <anthony.mcgivern@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Konstantin Babin <konstantin.babin@arm.com>,
	Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 15/24] media: Documentation: Add Mali-C720 ISP
 documentation
Message-ID: <20261128014225.kEBjBbCy-lkp@intel.com>
References: <20261124-b4-initial-upstream-candidate-v1-15-0cb9bde1bd30@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-15-0cb9bde1bd30@arm.com>

Hi Anthony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Anthony-McGivern/media-uapi-Add-24-bit-Bayer-media-bus-formats/20261124-170729
base:   b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
patch link:    https://lore.kernel.org/r/20261124-b4-initial-upstream-candidate-v1-15-0cb9bde1bd30%40arm.com
patch subject: [PATCH 15/24] media: Documentation: Add Mali-C720 ISP documentation
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261128/20261128014225.kEBjBbCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128014225.kEBjBbCy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/admin-guide/media/mali-c720.rst:215: WARNING: Title underline too short.
--
   Capturing Bayer data and processing it to RGB
   -------------------------------------------- [docutils]
>> Documentation/admin-guide/media/mali-c720.rst:370: WARNING: Footnote [3] is not referenced. [ref.footnote]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.


vim +215 Documentation/admin-guide/media/mali-c720.rst

   211	
   212	    media-ctl -l "'mali-c720 fr 0 pipe':1->'mali-c720 fr0-rgb':0[1]"
   213	
   214	Capturing Bayer data and processing it to RGB
 > 215	--------------------------------------------
   216	
   217	To capture 1920x1080 Bayer data from the source and push it through the ISP's
   218	full processing pipeline, we configure formats from the input source towards
   219	the output.
   220	
   221	The TPG produces 16-bit Bayer data, the input subdevice outputs this as 24-bit
   222	Bayer. The input pipeline, represented by the ISP subdevice, transforms the
   223	data into the square-root domain and feeds 16-bit Bayer into HV. Within HV,
   224	the debayering occurs and then produces the 12-bit RGB input used by FR0.
   225	
   226	For our example, the formats are configured as follows:
   227	
   228	.. code-block:: none
   229	
   230	    media-ctl -V "'mali-c720 tpg 0':0[fmt:SRGGB16_1X16/1920x1080]"
   231	    media-ctl -V "'mali-c720 input':1[fmt:SRGGB16_1X16/1920x1080]"
   232	    media-ctl -V "'mali-c720 isp':0[fmt:SRGGB24_1X24/1920x1080]"
   233	    media-ctl -V "'mali-c720 hv pipe':0[fmt:SRGGB16_1X16/1920x1080]"
   234	    media-ctl -V "'mali-c720 fr 0 pipe':0[fmt:RGB121212_1X36/1920x1080]"
   235	
   236	Images can then be captured from the FR0-RGB video device:
   237	
   238	.. code-block:: none
   239	
   240	    yavta -f RGB24 -s 1920x1080 -c10 /dev/video0
   241	
   242	Capturing from multiple outputs
   243	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   244	
   245	The RGB and YUV outputs can capture images at the same time. For example,
   246	enable both FR0 capture nodes:
   247	
   248	.. code-block:: none
   249	
   250	    media-ctl -l "'mali-c720 fr 0 pipe':1->'mali-c720 fr0-rgb':0[1]"
   251	    media-ctl -l "'mali-c720 fr 0 pipe':2->'mali-c720 fr0-yuv':0[1]"
   252	
   253	Starting the first video device validates the entire media pipeline and
   254	prevents further format changes. As such, when capturing from multiple outputs,
   255	formats must be configured on all enabled subdevices and linked video devices
   256	before starting any streams. For example, set both capture formats using v4l2-ctl:
   257	
   258	.. code-block:: none
   259	
   260	    v4l2-ctl -d /dev/video0 --set-fmt-video=width=1920,height=1080,pixelformat=RGB3
   261	    v4l2-ctl -d /dev/video1 --set-fmt-video=width=1920,height=1080,pixelformat=NV12
   262	
   263	Then run the two capture processes concurrently:
   264	
   265	.. code-block:: none
   266	
   267	    yavta -c10 /dev/video0 &
   268	    yavta -c10 /dev/video1 &
   269	    wait
   270	
   271	Cropping the image
   272	~~~~~~~~~~~~~~~~~~
   273	
   274	The full-resolution pipeline can crop to a minimum resolution of 64x64.
   275	To crop the image, configure the pipe's source pad crop rectangle and set
   276	the format on the video device. The FR pipeline has one shared crop for
   277	its RGB and YUV outputs. Setting the crop on either source pad updates
   278	both source crops and output dimensions:
   279	
   280	.. code-block:: none
   281	
   282	    media-ctl -V "'mali-c720 fr 0 pipe':1[crop:(640,300)/640x480]"
   283	    yavta -f RGB24 -s 640x480 -c10 /dev/video0
   284	
   285	Downscaling the image
   286	~~~~~~~~~~~~~~~~~~~~~
   287	
   288	The full-resolution pipeline can produce full-size, cropped or downscaled
   289	images. Downscaling by up to ~16x is supported, provided the minimum 64x64
   290	output resolution is adhered to. For the best image result the scaling ratio
   291	for each direction should be the same. Scaling is configured with the compose
   292	rectangle on the pipe's sink pad. RGB and YUV outputs share the same
   293	scaling configuration:
   294	
   295	.. code-block:: none
   296	
   297	    media-ctl -V "'mali-c720 fr 0 pipe':0[compose:(0,0)/640x360]"
   298	    yavta -f RGB24 -s 640x360 -c10 /dev/video0
   299	
   300	Cropping is applied after scaling. To combine the two operations, set the
   301	compose rectangle first, then the crop rectangle.
   302	
   303	Capturing images in YUV formats
   304	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   305	
   306	Within the full resolution pipe there is a colour space conversion block for
   307	the YUV conversion, but its design permits the RGB and YUV to be output
   308	simultaneously. Enable the link between the pipe and the YUV video device,
   309	then configure a capture format like NV12:
   310	
   311	.. code-block:: none
   312	
   313	    media-ctl -l "'mali-c720 fr 0 pipe':1->'mali-c720 fr0-rgb':0[0]"
   314	    media-ctl -l "'mali-c720 fr 0 pipe':2->'mali-c720 fr0-yuv':0[1]"
   315	    yavta -f NV12 -s 1920x1080 -c10 /dev/video1
   316	
   317	.. _mali-c720-frame-scheduling:
   318	
   319	Frame scheduling and Media Requests
   320	===================================
   321	
   322	Frame scheduling depends on whether the streaming videobuf2 (VB2) queues use
   323	direct buffer queuing or Media Requests. Use of Media Requests is optional.
   324	
   325	Direct mode
   326	-----------
   327	
   328	When all streaming image capture queues use direct buffer queuing through
   329	:ref:`VIDIOC_QBUF`, the driver schedules frames in free-running mode.
   330	Scheduling starts only when at least one image output buffer is ready.
   331	Once started, it continues scheduling frames using the available buffers.
   332	Empty image capture queues disable their respective capture for the
   333	scheduled frame.
   334	
   335	Request mode
   336	------------
   337	
   338	If any of these streaming VB2 queues uses Media Requests, scheduling starts
   339	when a request is queued. Each subsequent frame also requires a queued
   340	request.
   341	
   342	Applications allocate a request using :ref:`MEDIA_IOC_REQUEST_ALLOC` on the
   343	media device.
   344	Image buffers are associated with it through
   345	:ref:`VIDIOC_QBUF`, setting ``V4L2_BUF_FLAG_REQUEST_FD`` and ``request_fd``.
   346	The request is then submitted using :ref:`MEDIA_REQUEST_IOC_QUEUE` on the
   347	request file descriptor.
   348	
   349	Controls cannot currently be associated with Media Requests. Requests
   350	containing controls are rejected when queued.
   351	
   352	A request does not need to include a buffer for every capture queue.
   353	Queues without a buffer will be disabled for the scheduled frame.
   354	
   355	All buffers associated with the request are usually applied on the same
   356	frame, but a request could span multiple frames if multiple buffers are
   357	queued for the same buffer queue. Completed buffers are returned to userspace through
   358	:ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`.
   359	
   360	It is permitted to queue buffers directly in other VB2 queues alongside
   361	those operating in request mode, with requests still driving scheduling.
   362	Whenever a request is scheduled, available buffers from these queues can
   363	be used for the same frame, alongside buffers associated with the request.
   364	
   365	References
   366	==========
   367	
   368	.. [1] https://git.linuxtv.org/v4l-utils.git/
   369	.. [2] https://git.ideasonboard.org/yavta.git/
 > 370	.. [3] https://support.arm.com/compute-ip/mali-c720ae

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
