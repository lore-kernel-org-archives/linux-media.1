Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8330C160;
	Thu, 20 Aug 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211259; cv=fail; b=oL0vwtpyNbKpbEXGZ+ce4xfpjWIPI/kztCPL2oWdgLcKAKRRtvoBV03ug4FKJb3MUqIuPuVtYyL4xMJMjS4SPe9G3+bwdgCjJyF7n99Bsn4k9gDwBlAFhIfXZZOKXwA309j9n9FEkYZWmmsJgU69nYGrRqz60DmLhLax51oTjuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211259; c=relaxed/simple;
	bh=LvTNPxRXdzM70Y0Oo2ZWIkFeh2c1eci3x7/AUL4P5yc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gihSUKlKEt9Np2WOAnOzLi4OZDbequ27/Zgvrxu5Ki1NCpOMUWRfDLF8YU+xZ+bUXy0ETO5PbQNPo5+P23hc33I/mi3C3FL6Dx0a67EbOnSWauJD8TcYVJcMW+c7zPeDEWDiIMsQaiC9muHLZ8nPNW8CXgSnF7qzK4E1boK7uSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JxXQc5/t; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JxXQc5/t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTCcCtqa3qhj+6c8PzYChdnm2oyD9Ig8nVWeJRdYpBBI6IWXn+UXlgRw0OS7zTiqlaMzY45eoow9yIj77s6jesseYVhATvdfnNbs3F3yfSZxSS9FhP0o5FeFd1rA1cyIv7/a1fRzeNZOkyt3Cpf+PFyhXF17KiqreRxlKkaU+L9KHtfC5Z2oRE+/fm0fi25M/kLZ+4L0tuAqqKTHhqQZM4RGeD5Q95Dzw/U3N6glthoVXFvsR1JzQPx7IiqR0geWU5JeEVgk14eAKLUYeMY8A5tkYOM9+bFAp9cgiv09smhCyJ9JsjNiNsGeYwhieHoMsVMtmCApvfxW5hToG1dW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMVi4EXnloPKdA5KPgZqyTpfk+cic8LcizMNzdku5IA=;
 b=sRFaCOVnNdB50tEt85aW4rcNDvYT4jh810hdFnsTLed3C9iq7KdO6JLGA4pSdjIWMCdF+5MG0ePoNGzlLf8InuqIuGhYf/Jgnj5blo+OTF/QN+q2Auti1KMtrQCHg8rXM31Ag+JH724KKCiXWzOfMlt5aAnfWbN6FhlnmGjFlcwYmhNYR/dYUBGlSTqopL9NdALj1/9wG2DQgywj0PScjhcS2LJmJOmJ+SCgihfU7fxku6OINBsKMLLtdGSixHd034zhyb/JPYwz/k1JC84JWw3dnVYhrJG2AsvksFkQRCMT+uBNqP9XA0D5dYyc5FOP2DG/GAR2RgjobKBXOOf78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMVi4EXnloPKdA5KPgZqyTpfk+cic8LcizMNzdku5IA=;
 b=JxXQc5/t5CZHCgQ30b/9lr5bQJb7dZs3pNTJdUpyX/XNA/9L4Jedt78e9p2b+WkaiCm/rNHeG39ja3GcPVX/DLEVqGvNme7RqKXA8ZPh0u2aADgMmmxQWE//lD3f7JwDqZeKzrgWMsrS3zdgntwAwjr9Gl+Ox9R+BOrI03TOwpdVFXJxjQMLP4QsVDExAS21GOS16UeTlU0mjeRRfak008rtyZRIHFjcBVF99pX0uXQeqg6eOeVNzqOa2iPFCdu8fnoSSaOyDxIkkFBVL3uF6RniPiafZToa31mSS1Ij0A7J1ASEfZ3f5C8mWaoaKvKvL4fhm1XJoYEMEGNJxR7lcg==
Received: from AS8PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:311::23)
 by PRAPR10MB5322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:297::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 07:34:10 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:311:cafe::54) by AS8PR05CA0018.outlook.office365.com
 (2603:10a6:20b:311::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 07:34:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:34:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:39:43 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 20 Aug
 2026 09:34:08 +0200
Date: Thu, 20 Aug 2026 09:34:00 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hugues Fruchet
	<hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/14] media: stm32: dcmipp: add support for MP2x
 pixel pipes
Message-ID: <aoat6DXYX1z3euI2@gnbcxd0016.gnb.st.com>
References: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260820-stm32-dcmipp-pixel-pipes-support-v4-0-d212eb4e3792@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|PRAPR10MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cdcc35-88ef-431a-f9e6-08defe8d6c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|6133799003|22082099003|18002099003|3023799007|5023799004|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	u+KV9LlcrQK0UyTEn16/OQ4a5BBnT0QcOgnHmr0QGYHc21Eec9tsFrMw1rEBXYB0EBUM/PNWt3m319Bg6ZNNgGErcpGrEIbdRXWkVMIod22eCa9RY4zvdjToY99x3Qks/dZwF2Zvrfx/jDvFzwss4raJHcfsfXTUyObZeZlXinn3v3tut4jzSNaDEHk+VUSCEyawDercJDXxY6+KQuZrtSNqhEDBf2Ltd+Q2nrcMBQwUegZVT2uMJwffzGvDqYcyTOqrHCgT14X3ORkI95ztT9a5MTRHSLgtwZ2pi0KSdd1Ar/PUuArCFvh0WgbnYftepR+41K2sivwL8b4A4tcip85YbbVbr4WzVKLw+wP//hEKCOCjMM3Rz5Vldvd9ZOKB5cs4aWBz8HXkoKWoia5Ct7pxilRqygFmHqvj/g5OoGrHF5AEBsw7kgX79FkiSG1wxt4uq4FVBscNrp1TmMFLxYVT2ZnBr1RfxZkQCHz+eWaIjgFa37+F/lpkLkyHX8vlgPNSAH0waRCe7qOIcvTGuejZPM86VsfesJhiQTkjN2BcKGLbngnmmJwaALpHxJydSj8Q+ZTCTLtPoS47NrkoWhgNItuUk+2o6A7M8mY9ux6YAMc/karxYVBp4UBQfdO5zfgmF7FNF4YeReKaQUktTqBfINm5uqNgkcVREEt0ytw=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v8hT5mqqMpY5jZM+9VFFE4tsSfpzBhvkgJ/HDMALtH60Ua1e1135XrYZ6LY/3D3Zo+2HLoqgV/YfnwKy/SwenqdUn0Nzy5I2Oq5Bjc4jFmhigVm/jU4MXLCwalqx5KOhQUPEfB/Wj4UkFgBLh29j66ucrVBgbh6xerPKprjL87sRFn9kn/MHUvJhibcw2dtWJ4hE/YxXXHEGyKrTS5z8Xreq8OxifVKLPmqrEREN7vuTzEhKkK7TwvKL8Ouul1vKvYQJ1hw+xAZmgWTTRA/fQKMRYsAsPHzg3R7y542PrubIM/DM+OVeC9mCvNfS1SY89xHcMRPokcD1pYlKVVAXKYtezZqozW+20UMUSR4iOMV4s3vFK9an+y8CFijCnUs91rynR8FIbErhuhRI6+hip9hkffpogF7QmpeLMR04GqFIBuu08IjMO4O//fpPick7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:34:09.3973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cdcc35-88ef-431a-f9e6-08defe8d6c58
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5322

Hi,

please find below the result of v4l2-compliance -s -dx calls on all 3
pipes (dump (0), main (1), aux (2)).
Prior to each call, proper media-ctl calls are done in order to perform
the correct routing for each use-case.

-- DUMP video device --

/usr/local/bin/v4l2-compliance -s -d0
v4l2-compliance 1.33.0-5496, 64 bits, 64-bit time_t
v4l2-compliance SHA: 52a88f729238 2026-08-10 14:44:45

Compliance test for dcmipp device /dev/video0:

Driver Info:
	Driver name      : dcmipp
	Card type        : stm32_dcmipp
	Bus info         : platform:48030000.dcmipp
	Driver version   : 7.2.0
	Capabilities     : 0xa4200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : dcmipp
	Model            : DCMIPP MDEV
	Serial           :
	Bus info         : platform:48030000.dcmipp
	Media version    : 7.2.0
	Hardware revision: 0x00000030 (48)
	Driver version   : 7.2.0
Interface Info:
	ID               : 0x0300000b
	Type             : V4L Video
Entity Info:
	ID               : 0x00000009 (9)
	Name             : dcmipp_dump_capture
	Function         : V4L2 I/O
	Pad 0x0100000a   : 0: Sink
	  Link 0x02000021: from remote pad 0x1000008 of entity 'dcmipp_dump_postproc' (Video Scaler): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
		warn: v4l2-test-buffers.cpp(2220): Cannot test DMABUF, specify --expbuf-device
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for dcmipp device /dev/video0: 60, Succeeded: 60, Failed: 0, Warnings: 1

-- MAIN video device --

/usr/local/bin/v4l2-compliance -s -d1
v4l2-compliance 1.33.0-5496, 64 bits, 64-bit time_t
v4l2-compliance SHA: 52a88f729238 2026-08-10 14:44:45

Compliance test for dcmipp device /dev/video1:

Driver Info:
	Driver name      : dcmipp
	Card type        : stm32_dcmipp
	Bus info         : platform:48030000.dcmipp
	Driver version   : 7.2.0
	Capabilities     : 0xa4200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : dcmipp
	Model            : DCMIPP MDEV
	Serial           :
	Bus info         : platform:48030000.dcmipp
	Media version    : 7.2.0
	Hardware revision: 0x00000030 (48)
	Driver version   : 7.2.0
Interface Info:
	ID               : 0x03000016
	Type             : V4L Video
Entity Info:
	ID               : 0x00000014 (20)
	Name             : dcmipp_main_capture
	Function         : V4L2 I/O
	Pad 0x01000015   : 0: Sink
	  Link 0x02000029: from remote pad 0x1000013 of entity 'dcmipp_main_postproc' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
		warn: v4l2-test-buffers.cpp(2220): Cannot test DMABUF, specify --expbuf-device
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for dcmipp device /dev/video1: 60, Succeeded: 60, Failed: 0, Warnings: 1

-- AUX video device --

/usr/local/bin/v4l2-compliance -s -d2
v4l2-compliance 1.33.0-5496, 64 bits, 64-bit time_t
v4l2-compliance SHA: 52a88f729238 2026-08-10 14:44:45

Compliance test for dcmipp device /dev/video2:

Driver Info:
	Driver name      : dcmipp
	Card type        : stm32_dcmipp
	Bus info         : platform:48030000.dcmipp
	Driver version   : 7.2.0
	Capabilities     : 0xa4200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : dcmipp
	Model            : DCMIPP MDEV
	Serial           :
	Bus info         : platform:48030000.dcmipp
	Media version    : 7.2.0
	Hardware revision: 0x00000030 (48)
	Driver version   : 7.2.0
Interface Info:
	ID               : 0x0300001d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001b (27)
	Name             : dcmipp_aux_capture
	Function         : V4L2 I/O
	Pad 0x0100001c   : 0: Sink
	  Link 0x0200002d: from remote pad 0x100001a of entity 'dcmipp_aux_postproc' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
		warn: v4l2-test-buffers.cpp(2220): Cannot test DMABUF, specify --expbuf-device
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for dcmipp device /dev/video2: 60, Succeeded: 60, Failed: 0, Warnings: 1


Regards,
Alain


On Thu, Aug 20, 2026 at 09:22:28AM +0200, Alain Volmat wrote:
> This series add support for the main & aux pixel pipes
> available on the MP2x. In addition to the byte pipe
> already available, the DCMIPP is able to process two
> other streams in parallel, including ISP operations
> such as demosaicing, exposure etc, post-processing operations
> such as cropping, downscaling and various pixel formats
> output.
> 
> This series introduces the whole DCMIPP pipelines including
> static configuration of the ISP part (such as demosaicing).
> Dynamic control of the ISP as well as statistic extraction
> part will be added on top of this serie via usage of 2 other
> video devices (input & output) for statistics extraction and
> dynamic ISP parameter injection.
> 
> Changes in v4:
> - Allocation of a ST DCMIPP specific user defined CID range
> - Rename of the pixelproc control into V4L2_CID_DCMIPP_PIXELPROC_GAMMA_CORRECTION_ENABLE
> - Rename of the pixelproc control as "Gamme Correction Enable"
> - Addition of a new header file include/uapi/linux/media/st/dcmipp_config.h
> - Link to v3: https://patch.msgid.link/20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com
> 
> Changes in v3:
> - Rebased on top of kernel v7.2-rc4
> - Fixed most of Sashiko review points
> - Link to v2: https://lore.kernel.org/r/20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com
> 
> Changes in v2:
> - Rebased on top of kernel v7.1-rc6
> - check-patch minor fixes
> - replaced kzalloc(.., sizeof(..),) with kzalloc_obj
> - Link to v1: https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com
> 
> ---
> Alain Volmat (14):
>       media: stm32: dcmipp: share struct dcmipp_device among subdevs
>       media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
>       media: stm32: dcmipp: bytecap: protect CMIER register access
>       media: stm32: dcmipp: move common structures in dcmipp-common.h
>       media: stm32: dcmipp: correct swap in YUYV data with parallel input
>       media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
>       media: stm32: dcmipp: introduce a dcmipp global media_pipeline
>       media: stm32: dcmipp: add pixel pipes helper functions
>       media: stm32: dcmipp: addition of a dcmipp-isp subdev
>       media: uapi: Add controls for ST DCMIPP Driver
>       media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
>       media: stm32: dcmipp: add pixel-pipe support in bytecap
>       media: stm32: dcmipp: rename bytecap into capture
>       media: stm32: dcmipp: instantiate & link stm32mp25 subdevs
> 
>  .../userspace-api/media/drivers/dcmipp.rst         |  14 +
>  .../userspace-api/media/drivers/index.rst          |   1 +
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
>  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
>  .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 600 +++++++++----
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 124 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 940 +++++++++++++++++++++
>  include/uapi/linux/media/st/dcmipp_config.h        |  16 +
>  include/uapi/linux/v4l2-controls.h                 |   6 +
>  14 files changed, 2380 insertions(+), 285 deletions(-)
> ---
> base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
> change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
> 
> Best regards,
> --  
> Alain Volmat <alain.volmat@foss.st.com>
> 
