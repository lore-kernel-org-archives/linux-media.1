Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406808;
	b=iRVAjJUi9H5kQvAtI0gFeuqXBHU+khEgeNNzwwMuir4M0mRCEU7wYewe6QsHEPrsfjG3
	 WWo0tZy1I3vC8/5yYnan2w0uk6tXp1oKGTquTbm1l9s8LqE3W6IuOiCB8sSpkMMHn2qh9
	 TAL8F1MY5kct50OYpiT93YeuNpEp5lImiaeVj28b+9qglFBZk/lA4RFlGRfKehKYD5YVX
	 IG/MIvvHiy/ihJGsgLQHAXqxKd4ncSp76jnIViGu2+EkJroIjkwTvIA4SQNWnWEAJorWh
	 RFw7lICZsbPiD5QyfYoIMxMgMtZLzojoz5pUWFjfkMgxxqJ8K0DgujzuThS9eEabfjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406808;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-ID:To:
	 Cc:Content-Type:Content-Transfer-Encoding:MIME-Version:X-Debian-User;
	bh=NEcZbHklN3V9auDkQi4FGiF8iGv0oOjAgVRx5RqMCok=;
	b=WAjPyArGfUF0xjGRx5lXfc+H9Elgb4kN6tzYOc52gH5h3rorPYgMyeux96WDYZIKva9L
	 EKvy31yT95D3YOwo5JcOn4ugjGJWK659GGBYNFEzFAPqx7IkBOnCuF0XEq45IVNOZ6DBl
	 gMQcrHh8sYBHQNm90T7YSz0G0I6Qt3I0EEyTo68PxjtDSFbiwZquX0aFerwbSSvotCqnh
	 nRTVCOwZb6E+I7TAzGuRiouEyS0dnwCoj75WOdDYx151eBTF7AODbabAZzNVOIpIbZgJ0
	 g1JjYC7tsJN400lurudQCajcL5beedQ0cw8mcnPQ+jAie6sm9UoH219MX25AYCqhKvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=h2J6l1jN;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F8606A321
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 14:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=h2J6l1jN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:Cc:To:Message-ID:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NEcZbHklN3V9auDkQi4FGiF8iGv0oOjAgVRx5RqMCok=; b=h2J6l1jNYACji+g656cTwiacLL
	ekAT11ReKuopD5eDc01FhZ2KkzFI4bJ8AD8koilxQYOO5chtasOcDTP2aPAPBqiCC/JTsKnqZJvf7
	nPEKvZW4N38+MQFDZIWOf3gaXqB+D+DPGhDj3NsxpljbtAiYNZ1PTWI4vmujrLzetjO9ygNJkyxGr
	xyT/mMS56c+pz73VoFmpaZYE/JazsGbkqNI5rVjLbSc3BxF8fXn7eDnF82qACyymG78YXzHQo1Zxe
	8qjgWCHj4E0Nq7T7MuA4d848bf3IuK1DGOAitMAA6e+jgjL0cVSFpA+cpnqXXy8Nk4NaL2TzspBbz
	3zkAr/Dg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xR9BA-00DF9t-2V;
	Wed, 11 Nov 2026 14:20:01 +0000
From: Emfox Zhou <emfox@debian.org>
Subject: ipu6: no frames from a RAW8 stream while i-wake is enabled
Date: Wed, 11 Nov 2026 22:19:49 +0800
Message-ID: <179440678990.22608.10861693465599640177@debian.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Antti Laakso <antti.laakso@linux.intel.com>,
 Sarang Sapre <sarang.sapre@intel.com>,
 Divyamani Tripathi <divyamani.tripathi@intel.com>,
 Manik Bajpai <manik.bajpai@intel.com>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Debian-User: emfox

Hi,

On a Surface Pro 8 (Tiger Lake, IPU6) with the VD55G0 IR sensor on CSI2
port 5, a RAW8 stream never delivers a frame while i-wake is enabled.
STREAMON succeeds, no buffer ever completes, and the receiver reports

	intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-5 error: Transfer FIFO overflow

The same sensor, same link and same line length register, with only the
mbus code changed from Y8_1X8 to Y10_1X10, delivers every frame.

What the driver computes (7.4-rc2, line length register forced to 1440 px
in both runs; the fill column is 200 KiB / rate, the rest is printed by
the driver):

	format      rate  fill     did written      threshold  frames
	Y8_1X8      140   1462 us  1023 (clamped)   92         0 / 10
	Y10_1X10    112   1828 us  1023 (clamped)   93         5 / 5

The watermark numbers are not what separates the two cases: the failing
stream has the smaller fill time and a slightly smaller threshold, and
both hit the same did clamp.

Ruled out on this machine:

- CPU idle latency. Three cores at 100% for the whole capture changes
  nothing, twice. Same error string as Hans' report of October 2025
  (<8afc906b-eb00-49aa-9f04-6debe67b148e@kernel.org>), but there the CPU
  load made it go away.

- Capture node pixel format. GREY and BA81 both fail.

- Line period. Stretching the VD55G0 line length register from 1200 to
  1440 px moves the RAW8 line period from about 12.1 us to 14.5 us and
  every frame is still lost. This is not a complete test: bpp covers both
  the bytes per line and the pixel rate, so RAW10 at the same register
  setting has an 18.2 us line period and the two were never matched
  exactly.

With i-wake disabled the RAW8 stream works, which is how I have been
capturing frames so far.

On the host side the only thing that differs is the MIPI data type handed
to the firmware: ipu6_isys_get_frame_desc() takes it from the mbus code
through ipu6_isys_mbus_code_to_mipi(), 0x2a for RAW8 and 0x2b for RAW10.
I could not find any other host-side handling that depends on the bpp.

So before writing anything: is a RAW8 stream expected to work with i-wake
at all, or should the driver simply not enable it for that data type?

The error line above only appears because I read the receiver status once
when the stream stops. In 7.4-rc2 ipu6_isys_csi2_error() is only called
on PIN_DATA_READY, which never happens when no frame completes, so a
stock kernel shows nothing at all. That change is eight lines and is
appended below.

Reproduction, sensor at 640x600 on port 5, capture node 40:

	media-ctl -d /dev/media0 \
	  --set-v4l2 '"vd55g0 3-0060":0[fmt:Y8_1X8/640x600]' \
	  --set-v4l2 '"Intel IPU6 CSI2 5":0[fmt:Y8_1X8/640x600]' \
	  --set-v4l2 '"Intel IPU6 CSI2 5":1[fmt:Y8_1X8/640x600]' \
	  --link '"Intel IPU6 CSI2 5":1 -> "Intel IPU6 ISYS Capture 40":0[1]'
	v4l2-ctl -d /dev/video40 \
	  --set-fmt-video=width=640,height=600,pixelformat=GREY \
	  --stream-mmap --stream-count=10 --stream-to=/tmp/f.raw

With Y10_1X10 from the sensor up to the port and pixelformat='Y10 ', the
same commands deliver ten frames.

Thanks,
Emfox Zhou

8< ---
Patch mentioned above, applies to v7.4-rc2:

From: Emfox Zhou <emfox@debian.org>
Subject: [PATCH] media: ipu6: report CSI2 receiver errors when a stream stops

ipu6_isys_csi2_error() is only called from the PIN_DATA_READY path, so a
stream that never completes a frame never reads the receiver status and
reports no error at all.  The only visible symptom is that STREAMON
succeeds and no buffer ever completes.

Read the accumulated status once when the stream is disabled.  On a
machine where a stream overflows the receive FIFO this turns a silent
failure into

	csi2-5 error: Transfer FIFO overflow

No functional change for streams that do complete frames: the status bits
are write-1-to-clear and are cleared right after being read.

Signed-off-by: Emfox Zhou <emfox@debian.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 152545427..e2b00f889 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -767,6 +767,14 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	struct ipu6_isys_stream *stream =
 		ipu6_isys_find_stream_firmware(csi2, vc);
+
+	/*
+	 * Receiver errors are otherwise only reported on PIN_DATA_READY, so a
+	 * stream that never completes a frame reports nothing at all. Read the
+	 * accumulated status once on the way out.
+	 */
+	ipu6_isys_csi2_error(csi2);
+
 	ipu6_isys_stop_stream_firmware(stream);
 
 	if (IS_IPU7(isp) || IS_IPU8(isp))
