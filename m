Received: from spamfilter1.site.eu (spamfilter1.site.eu [80.249.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0791E5207
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.249.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084212; cv=none; b=V1EvVFlhvEFAcTG+kF5/7Aa7arhyHk9Nh7GMEjT1bvQLPe1Ovs0Q/EgY0Md0HRWpDZNIuZVc3ba3YicznrP/B+LiGAsLDG9lzKn1Cvpiw9N2UCX3W+R0qVnZrUsCQfW9XOV5EaVuCG7p2PsIZA4W8Z7fzmOOtpCFU+Ipx47XUXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084212; c=relaxed/simple;
	bh=ZV96mWqiDFAseM4MIEERU3BRr9imTw/cijwBOuLnexo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=c5fsxAirDY1W0l60p6fYC3knMC7NphpAMxl7xNAH3i+lylG4Bh+yxjNgj4cLI7cTh0B2s/ILvKEDp2bkS28LkOW0XNZAZfi+et3E7dsXaqYC0YHjMB8lzZXbBak23b+rifRdglP8bsSCamG15UnCh+RyRL0zmUU4+DH2g5DCrP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bernardvanderwees.com; spf=pass smtp.mailfrom=bernardvanderwees.com; dkim=pass (4096-bit key) header.d=bernardvanderwees.com header.i=@bernardvanderwees.com header.b=1p3x/OMe; arc=none smtp.client-ip=80.249.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bernardvanderwees.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernardvanderwees.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=bernardvanderwees.com header.i=@bernardvanderwees.com header.b="1p3x/OMe"
Received: from spamfilter1.site.eu (localhost.localdomain [127.0.0.1])
	by spamfilter1.site.eu (Proxmox) with ESMTP id C1808E90E5;
	Fri,  3 Jul 2026 15:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	bernardvanderwees.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:from:from:message-id
	:mime-version:reply-to:subject:subject:to:to; s=site-eu1; bh=IoR
	ncO6x2EpB6oK2lx7YkXu1U3MceSVCk4nSpKydDAA=; b=1p3x/OMez17STQHfxxo
	WUT8U3ZZNukfAzYXgvm/wJULCNM9Ngs6WANvLCxLOGaDiYOlnK9eoGv3D4iRjZR8
	A+a0NLMxKf5v+azNwzUHyCzW2LUVhkD4alqSkC4cApV8fFBj2EGoQa2D+9sRNuJs
	YGYwSq8ab+SWWLkTj6Nt94Wcdta79fprexWL9+Fq3HDObbpb2FbFNnd8p/Aa0h2B
	ta8jXbSWbVW8MFEYDCnCEerve6OiNjy0aqQlP0c+e5TBRIc/jQCLhuPLSbLnIUiN
	zoAJs5qN9q2w5GoCcDXZYO1cNDwv4YQpCEt3flqCDjNvL3Q/iDrEJzAOcsER8g7A
	0DoWpODWoA2duV/INi5tnRjhVdphyXnVLRH1q2ibstyrhTDKjp49gdhPSI8qLkm+
	1BCtaWtG4SqUkR9Z7b5EL18RI/bX23lylHxcZLvf5sTbdkw/8td2fRRRMnHOAUJj
	kX6dPlBtXnny3raGpubMcVrvNcneh7QWyjRU3Al0zj9fCEm8OygotM+GVUEWm/Bu
	VrIibmAvN22aQWD5x8DZVEFYnbhp22POXvqSJCo8+ApNigg0doEmVxC/w5w8cMyK
	TCAeWnhHQAeUqJ4OxsD1dPb7OzU62KLJiz+l9rySN2lTQGxX0jYT9NpTxdbVHCAj
	qVlAZbhe8TRZGmHgrY9xV9zI=
Received: from mail-rl1.site.eu (mail-rl1.site.eu [103.149.169.251])
	by spamfilter1.site.eu (Proxmox) with ESMTPS id CD37EE90A6;
	Fri,  3 Jul 2026 15:04:14 +0200 (CEST)
Received: from mail003.site.eu (mail003.site.eu [103.149.169.203])
	by mail-rl1.site.eu (Postfix) with ESMTPS id B22B940213;
	Fri,  3 Jul 2026 15:04:13 +0200 (CEST)
Received: from [192.168.178.61] (unknown [91.33.167.192])
	(Authenticated sender: contact@bernardvanderwees.com)
	by mail003.site.eu (Postfix) with ESMTPA id 8ED5C5A02B6;
	Fri, 03 Jul 2026 15:04:13 +0200 (CEST)
Message-ID: <2761ae72-1f44-4082-a5ad-38a7313e0015@bernardvanderwees.com>
Date: Fri, 3 Jul 2026 15:04:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
Cc: hdegoede@redhat.com
From: Bernard van der Wees <contact@bernardvanderwees.com>
Subject: media: i2c: ov02e10: missing sensor rotation for Samsung 940XHA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans, list,

I'm reporting (with some AI help) a missing sensor rotation for the 
OmniVision OV02E10 camera
as mounted in the Samsung Galaxy Book5 Pro NP940XHA-KG1NL laptop I own.

The camera is physically mounted 180° rotated, but the Samsung ACPI 
firmware does not populate the _PLD (Physical Location of Device) 
rotation field. As a result, V4L2_CID_CAMERA_SENSOR_ROTATION is never 
reported by the driver, libcamera defaults to Rotation=0, and all camera 
apps show an upside-down image.

== Hardware ==
Manufacturer: SAMSUNG ELECTRONICS CO., LTD.
Model:        940XHA
Sensor:       OmniVision OV02E10
ACPI ID:      OVTI02E1
Kernel:       7.0.0-12-generic (Ubuntu 26.04 devel)
libcamera:    0.7.0-1ubuntu2

== Diagnosis ==
The sensor is detected and the driver loads correctly:

   $ modinfo ov02e10 | grep alias
   alias: acpi*:OVTI02E1:*

The physical_location/panel sysfs attribute correctly reports "front":

   $ cat /sys/bus/i2c/devices/i2c-OVTI02E1:00/physical_location/panel
   front

However, physical_location/rotation does not exist:

   $ cat /sys/bus/i2c/devices/i2c-OVTI02E1:00/physical_location/rotation
   cat: No such file or directory

The driver does call v4l2_fwnode_device_parse() (ov02e10.c:445), but since
the ACPI firmware provides no rotation data, the fwnode yields nothing and
V4L2_CID_CAMERA_SENSOR_ROTATION is never registered.

libcamera then hits the fallback path in camera_sensor_legacy.cpp:619:

   properties_.set(properties::Rotation, 0);
   mountingOrientation_ = Orientation::Rotate0;

Resulting in:

   $ cam -c 1 -p 2>/dev/null | grep -i rotation
   Property: Rotation = 0

The correct value should be 180.

Note: using cam's --orientation rot180 flag does correctly flip the captured
frames, confirming the sensor itself works fine and only the rotation
metadata is missing.

== Suggested fix ==

Similar to how other sensor drivers work around missing ACPI rotation data,
the ov02e10 driver should register V4L2_CID_CAMERA_SENSOR_ROTATION with a
default value of 180 for the OVTI02E1 ACPI match, so that libcamera (and
other consumers) can correctly orient the image.

Alternatively, an entry could be added to the libcamera sensor properties
database, but fixing it at the driver level is cleaner and benefits all
consumers of the V4L2 API.

Happy to test patches.

Thanks,
Bernard

System info:
   $ sudo dmidecode -s system-product-name
   940XHA
   $ sudo dmidecode -s system-manufacturer
   SAMSUNG ELECTRONICS CO., LTD.
   $ uname -r
   7.0.0-12-generic
   $ cam -l 2>&1 | grep -i camera
   1: Internal front camera (_SB_.LNK0)


