Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571769;
	b=YU8te3yuvQ3VIeANXAExK+BKuJwH/f4qZuf1SNH+lyEEQWEkH675mcM/yfe4L8pZNWTw
	 X8VurnPOjXspaW7D7IyzAyZfw5NDNwVpNEXG2saSRyW74Sh0VYDSjbx7QZcGMpg44H7J9
	 yWCUBLBQQCkgIpT4Xl3XEHBFBfS6SS4dYuFCmCbbH2lnQ/aB9PfDHGtgBW/BR+bbUx8bG
	 FknFev4k9rp31bryXh05hk8ar3m+CpBenum6fJ0JP2hIi27qnB6CLXwL0VPsQR6RK1dBt
	 g02tSk3DR95m2LjjBFj7xJ/P1BpqOoVcC6MnPCX7G65W9bpy/7hfoKti+9Uom/mfuhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s+jtLsYqjLT/9iWYV8dpU0ALDq0e3hFruzVXkIfGvEk=;
	b=FJ2pnnh0pBlP/k2rhXhxFq3TjQWeyH9JZsvD9dOJIEC1Jm1zxs7X3uuk1NsORM9KSDp3
	 WGc1EiD3i1ejD6LllEYp6jr9qKEfg2Asuvo+ceud7S8V2crkdc6WUyjviZXNrXznQ23XF
	 W7SqHKtQ/M8eRCt9hCVGKqkK702vjxHc0aLgQCcaAbGb9QgsW4Q9zebDdN/SC5sp4In/D
	 KBFbA1i65ObB0sdA9EoBPR1yOD1zTZV9N4id1inN/Qw1zEhW+Ts/lK/udq0fKY45H4Whf
	 Cd5SG5zg+FFQvU5b1453/mYy0coIR9aR3Za+lhpN8EpQsBQLyfJQ7t3zgocdpSndkeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nD1ePqHA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyFCoers;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C560701EA
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 22:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45C560701EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nD1ePqHA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyFCoers
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK6JE1808561
	for <linux-media@vger.kernel.org>; Sun, 1 Nov 2026 22:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+jtLsYqjLT/9iWYV8dpU0ALDq0e3hFruzVXkIfGvEk=; b=nD1ePqHA0CIksb6i
	2EcDiYOvACNvnvkAHDagd5QcTIre/xR61eX+PCETyBopBfjE62ExDOHyVxPhk9x8
	ZdHZF+7FkqTpAJDA14BzgdwVO5vPdQTV7KgaHcAIyd3eTiJxPxqJRCmNyVw1/gRa
	0+DJcKeL+0XVFYpRv+qp2nhYf52A4Ya9d9VhTbHNsy0FbVUQHWCd42iblwBx64MJ
	0rmskMl/lKFgSRyH7pS0zfC46d0bO7BlkFIItNmgcALfZXbpjQQz6w+3+KisWMb2
	d6PgAzhEld2DLy3EzgQKALL8s481liM4e/lJqaSfYwS3PUjx8NsRIQNdmeLii5pz
	EiyAuw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkmpv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 22:22:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2934669eec.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 14:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571766; x=1794176566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+jtLsYqjLT/9iWYV8dpU0ALDq0e3hFruzVXkIfGvEk=;
        b=jyFCoersuv21dASsrjYN6TVQURLlGUg0CrP2lA9N5TwVtle1zPIIQlWSjh5uOunDTW
         QRv7uLvxF21ZApNSMDmpD6Exxh3S/5K5BbAfMpAroNAoiN83w5oyjOLo5wdySDQZUjJS
         gltRPFXvlxELnu9yXYHfs42Az86nN5vOOEiqZCYgFCfoxLko41rPFu2sVyKkdXRoMp1b
         qfag6uRoLF+FXO4vKlihve9eKnSAdoeWtZp0vFkQczWrhTUbBFrSIrow+V1K2BH3uGSA
         3WbSJ9KzoJbJJwF3vtNHrOpFV/7Dp9n7eqwBBzJ4cU9WcU2rArpz6XjlFbJYzBUshZrF
         S4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571766; x=1794176566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+jtLsYqjLT/9iWYV8dpU0ALDq0e3hFruzVXkIfGvEk=;
        b=gT2hMNoCTTtSNJdWQp76i5bCpoBAExhfCHFH0zS3dMoMZ1xRcVBtiqeOS/kRJfkKXS
         YZk+uOo3brrtj5oJY2+6zmvIYvp2sNPdnFLqsB9s+A64OvASBzW7DAjh54B3Sid5NyyL
         xfJnNxf/Kt7BAN8w204koCy7CQ6dyPQnRanN0/s77YeIGtCl2fCxSrtehIJ7rUtTMK+I
         SyELRVlccdxArf2hKADXyuI58NI5pgkFIyyAsztDozblbEHtOJTsYoxkdrpWFud2i3Y2
         dQ/fUrFQ3dSxGd4iDptkhsXlX6R2UdjhzVQB584yqcTjRZ7q/DjqPf197VMMglY8lWeD
         dFuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6FcbiE+3hprqZK7oWo/D3rsGjJH+GaSIYuJFT6TGHRoelRiovut46QSHNGYa/Fb7qL3XteuWGjLlB7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1oQLTCINh0xrFN6+vVcTqJZEfaaJASnDeH1qE/GqD9aKFMy84
	vb6B070o+zlsQGgYIWhT9DO/RW1tNIPyZmL5GeWR6+ZEGsc3mu0yUReSnMHxt5GxeMroZq5KbPM
	NObUvHM/doux1eEMZI0oEW7u5v+EWdIKanHi70ZR6yzSwmYJV4YIgkj5vZapaDw7f1Q==
X-Gm-Gg: AYBFou1IV707D2BIYVmRpTn6d3rBAsejmFxetWkXLf52wT+BR6rBy4VJw3AKQ0iq6X2
	AzzafXvsg0ctk6i+n6VXhoR/lREqE5SgKMKVCOY6etCoU6Q0LUnHn2Hb5kSEiSG+AgQF4L6vS9y
	IkZZWFHaS43SeGSQIvyu/d4HLwyoEHmqgWBaomfiTLxVuHC6aBYpYJByjzAmhXux9v1celuBF2X
	8vtH43H8SlJxVNBaTr314PP5kO0uvQvOPlET5AAL24DezbnqwBjH2Z/1SpAXjtkOzopTLuEPCLt
	fxn0piuFH7Ox12OzT8CoE0f+2iVPhxOg1k6w+YAD/g39P0rFcbdsyIRa8Vjdvp3LQ4zyYO3//vI
	POEO7O+oDyi/zJ17rXV0WJKA07nvks7g2dOuYw0aUWJ1YjNTm5xiBfv3hzWnFHKDphdJTq1ju9h
	klXKbinQ==
X-Received: by 2002:a05:7022:f409:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1ac5bda5860mr17430641c88.22.1793571765996;
        Sun, 01 Nov 2026 14:22:45 -0800 (PST)
X-Received: by 2002:a05:7022:f409:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1ac5bda5860mr17430559c88.22.1793571765252;
        Sun, 01 Nov 2026 14:22:45 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:22:44 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:20 +0530
Subject: [PATCH v4 07/25] accel/qda: Add DMA-BUF import
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4-v4-7-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=17369;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=RL444x/sg/rzOR6uyKbKALt9WY+TrHm48Zl+LRncjFg=;
 b=TkXKODi6jNMMTCxTjpoEV/FAmpwtb//IOPG+EOB+cY8HyctphV2nD2Xt3+7Gl3q2D5WjdzlNS
 gJqexetIKUOCREussyG4u9mIz43Kt/YTq1KMlGeAyJofdyi0O7ZM8O2
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: NQE81z0vDV4OVwY3kyjSfyt7x2nnXzHl
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae7bbb7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MxAf9wYe4JIefUXzLYUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX2BD79tQtNOSl
 c1n57D9releE6en84IVqSszer62BQ7Y5Lz4ZNxTHllOtePxl5ZcHyzm2K/jrXuNOtMz7P14vds+
 H9CTeSQ/ERLl3S6VQsQ7TmLcWvUkGpI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXy6wenQRVK5RW
 YWapvFSprSysUNoIgAL8C5z5naSgVbhc5xRZ5vt7+Q6hthUcmHqr6P2TDQoBQ0Pcd1qII731Osk
 wC15FgFLjc/USin9gUMJcskDE7+GmsUDku7KPHYTA8RFOc5sTJFQdj+mJf5j/Esd5wdBU2adcOz
 2k8mk1KHZlwiPpTqpXhEX98Ea2gNdJ7PaDtpxEQRVXRLs720uM7HmQOY3YpT/m1stddCaxO9o52
 1Si18BKa891NnPecO2N6NetV/qGv+MiXmEtMMevxhIL9JfXy+wHd8pvMDh74rTCY6Vi8tz1sRzZ
 JJMJEe3KVGNOgKfuarMuI5KkR8A9ww6wRJeuKPLAGZGzPZvfbPlFzCKkfF8QQxuDy+qfUnlcaQH
 uQLVWz8FdXlgGfs/e+vceF02GjpqipTmzlLOkXFibRdmmIqaABYkNwgWIW+Z5GDmfHR3u0FpCYk
 AQ8ra1YynP4Vij00TYw==
X-Proofpoint-ORIG-GUID: NQE81z0vDV4OVwY3kyjSfyt7x2nnXzHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010089

Buffers the DSP works on often originate elsewhere - a camera frame to
run inference on, a video surface to post-process. Importing those
directly avoids a copy, so wire up the DRM PRIME import path.

A buffer has to be mapped into the context bank of the session that
imports it, not into the parent device's address space, or the DSP
would not be able to reach it under the session's stream ID. The core
PRIME helper takes the device to attach to, so pass the session's
context bank. It does not pass the calling file down to the import
callback, so the session is published on the device for the duration
of the call.

The DSP is told where a buffer is by a single address, so only buffers
that map as one contiguous range can be described to it. Whether an
exporter or an IOMMU produces a single range is not guaranteed, so
check rather than assume: handing over a multi-range buffer as its
first range alone would leave the DSP reading and writing past the end
of it into whatever follows in the context bank. Contiguous imports,
such as from the CMA DMA-BUF heap, are accepted; the rest are rejected.

Imported buffers own no memory, they only hold a mapping of the
exporter's, so they are released by handing the mapping back rather
than freeing anything, and cannot be mmap()ed through this driver.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile         |   1 +
 drivers/accel/qda/qda_drv.c        |   6 ++
 drivers/accel/qda/qda_drv.h        |  10 ++
 drivers/accel/qda/qda_gem.c        |  42 ++++++++-
 drivers/accel/qda/qda_gem.h        |  11 ++-
 drivers/accel/qda/qda_memory_dma.c |  13 +++
 drivers/accel/qda/qda_memory_dma.h |   2 +
 drivers/accel/qda/qda_prime.c      | 184 +++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_prime.h      |  25 +++++
 9 files changed, 291 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 2d3bcc3050eb..01c0319da900 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -12,5 +12,6 @@ qda-y := \
 	qda_ioctl.o \
 	qda_memory_dma.o \
 	qda_memory_manager.o \
+	qda_prime.o \
 	qda_rpmsg.o \
 	qda_soc.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 37019ff38ecb..5e953d1f98bf 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -12,6 +12,7 @@
 
 #include "qda_drv.h"
 #include "qda_ioctl.h"
+#include "qda_prime.h"
 
 static struct qda_session *qda_session_alloc(struct qda_dev *qdev)
 {
@@ -69,6 +70,9 @@ static const struct drm_driver qda_drm_driver = {
 	.postclose = qda_postclose,
 	.ioctls = qda_ioctls,
 	.num_ioctls = ARRAY_SIZE(qda_ioctls),
+	.gem_prime_import = qda_gem_prime_import,
+	.gem_prime_import_sg_table = qda_gem_prime_import_sg_table,
+	.prime_fd_to_handle = qda_prime_fd_to_handle,
 	.name = QDA_DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
@@ -82,6 +86,7 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 		return ERR_CAST(qdev);
 
 	INIT_LIST_HEAD(&qdev->cb_devs);
+	mutex_init(&qdev->import_lock);
 
 	return qdev;
 }
@@ -104,6 +109,7 @@ int qda_init_device(struct qda_dev *qdev, int num_cbs)
 void qda_deinit_device(struct qda_dev *qdev)
 {
 	qda_memory_manager_exit(qdev->iommu_mgr);
+	mutex_destroy(&qdev->import_lock);
 }
 
 int qda_register_device(struct qda_dev *qdev)
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index c852d3b05310..31aad9057e28 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -8,6 +8,7 @@
 
 #include <linux/device.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/types.h>
 #include <drm/drm_device.h>
@@ -50,6 +51,15 @@ struct qda_dev {
 	struct list_head cb_devs;
 	/** @iommu_mgr: Registry of this device's context banks */
 	struct qda_memory_manager *iommu_mgr;
+	/** @import_lock: Serialises PRIME imports, protects @importing_session */
+	struct mutex import_lock;
+	/**
+	 * @importing_session: Session currently importing a buffer. Set only
+	 * while @import_lock is held, to pass the session down to the
+	 * .gem_prime_import callback, which the DRM core does not hand the
+	 * calling file to.
+	 */
+	struct qda_session *importing_session;
 	/** @soc_data: Per-SoC DSP integration parameters */
 	const struct qda_soc_data *soc_data;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
index 864bac914e48..a9ab8ccb7893 100644
--- a/drivers/accel/qda/qda_gem.c
+++ b/drivers/accel/qda/qda_gem.c
@@ -3,6 +3,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
 #include "qda_drv.h"
 #include "qda_gem.h"
 #include "qda_memory_dma.h"
@@ -12,7 +13,13 @@ static void qda_gem_free_object(struct drm_gem_object *gem_obj)
 {
 	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
 
-	if (qda_gem_obj->virt)
+	/*
+	 * An imported buffer only holds a mapping of memory the exporter owns,
+	 * so hand the mapping back rather than freeing anything.
+	 */
+	if (drm_gem_is_imported(gem_obj))
+		drm_prime_gem_destroy(gem_obj, qda_gem_obj->sgt);
+	else if (qda_gem_obj->virt)
 		qda_memory_manager_free(qda_gem_obj);
 
 	drm_gem_object_release(gem_obj);
@@ -24,6 +31,10 @@ static int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struc
 	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
 	int ret;
 
+	/* Imported buffers have to be mapped through the exporter */
+	if (drm_gem_is_imported(gem_obj))
+		return -EINVAL;
+
 	/* The fake offset only identifies the object, it does not index into it */
 	vma->vm_pgoff = 0;
 
@@ -36,8 +47,35 @@ static int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struc
 	return 0;
 }
 
-static const struct drm_gem_object_funcs qda_gem_object_funcs = {
+/*
+ * Lets another context bank map this buffer when a session imports the
+ * dma-buf this object was exported as: see qda_gem_prime_import().
+ */
+static struct sg_table *qda_gem_get_sg_table(struct drm_gem_object *gem_obj)
+{
+	struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
+	struct sg_table *sgt;
+	int ret;
+
+	if (drm_gem_is_imported(gem_obj))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	sgt = kzalloc_obj(*sgt);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = qda_dma_get_sgtable(qda_gem_obj, sgt);
+	if (ret) {
+		kfree(sgt);
+		return ERR_PTR(ret);
+	}
+
+	return sgt;
+}
+
+const struct drm_gem_object_funcs qda_gem_object_funcs = {
 	.free = qda_gem_free_object,
+	.get_sg_table = qda_gem_get_sg_table,
 	.mmap = qda_gem_mmap_obj,
 };
 
diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
index af3b9dfc7509..1dab494197aa 100644
--- a/drivers/accel/qda/qda_gem.h
+++ b/drivers/accel/qda/qda_gem.h
@@ -6,6 +6,7 @@
 #define __QDA_GEM_H__
 
 #include <linux/dma-mapping.h>
+#include <linux/scatterlist.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -16,14 +17,20 @@ struct qda_session;
 
 /**
  * struct qda_gem_obj - A buffer the DSP can access
+ *
+ * Either allocated by this driver or imported from another one. Use
+ * drm_gem_is_imported() on @base to tell which; imported buffers have no
+ * @virt and own no memory, they only hold a mapping of someone else's.
  */
 struct qda_gem_obj {
 	/** @base: DRM GEM object base; must be first member */
 	struct drm_gem_object base;
 	/** @iommu_dev: Context bank this buffer is mapped into */
 	struct qda_iommu_device *iommu_dev;
-	/** @virt: Kernel virtual address of the buffer */
+	/** @virt: Kernel virtual address, NULL for imported buffers */
 	void *virt;
+	/** @sgt: Mapping of an imported buffer, NULL otherwise */
+	struct sg_table *sgt;
 	/** @dma_addr: Address of the buffer as the DSP sees it */
 	dma_addr_t dma_addr;
 	/** @size: Size of the buffer in bytes */
@@ -36,6 +43,8 @@ struct qda_gem_obj {
  */
 #define to_qda_gem_obj(gem_obj) container_of(gem_obj, struct qda_gem_obj, base)
 
+extern const struct drm_gem_object_funcs qda_gem_object_funcs;
+
 struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
 					     struct qda_memory_manager *iommu_mgr,
 					     size_t size, struct qda_session *session);
diff --git a/drivers/accel/qda/qda_memory_dma.c b/drivers/accel/qda/qda_memory_dma.c
index 0f4715a55b9d..e7c5d540c0c1 100644
--- a/drivers/accel/qda/qda_memory_dma.c
+++ b/drivers/accel/qda/qda_memory_dma.c
@@ -70,3 +70,16 @@ int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *vma)
 	return dma_mmap_coherent(gem_obj->iommu_dev->dev, vma, gem_obj->virt,
 				 qda_gem_dma_addr(gem_obj), gem_obj->size);
 }
+
+/**
+ * qda_dma_get_sgtable() - Describe a buffer's pages for an importer
+ * @gem_obj: GEM object to describe
+ * @sgt: Table to fill in; the caller frees it with sg_free_table()
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_dma_get_sgtable(struct qda_gem_obj *gem_obj, struct sg_table *sgt)
+{
+	return dma_get_sgtable(gem_obj->iommu_dev->dev, sgt, gem_obj->virt,
+			       qda_gem_dma_addr(gem_obj), gem_obj->size);
+}
diff --git a/drivers/accel/qda/qda_memory_dma.h b/drivers/accel/qda/qda_memory_dma.h
index f4d76b806df6..f1688d7a57ea 100644
--- a/drivers/accel/qda/qda_memory_dma.h
+++ b/drivers/accel/qda/qda_memory_dma.h
@@ -9,6 +9,7 @@
 #include <linux/mm_types.h>
 #include <linux/types.h>
 
+struct sg_table;
 struct qda_gem_obj;
 struct qda_iommu_device;
 
@@ -16,5 +17,6 @@ int qda_dma_alloc(struct qda_iommu_device *iommu_dev,
 		  struct qda_gem_obj *gem_obj, size_t size);
 void qda_dma_free(struct qda_gem_obj *gem_obj);
 int qda_dma_mmap(struct qda_gem_obj *gem_obj, struct vm_area_struct *vma);
+int qda_dma_get_sgtable(struct qda_gem_obj *gem_obj, struct sg_table *sgt);
 
 #endif /* __QDA_MEMORY_DMA_H__ */
diff --git a/drivers/accel/qda/qda_prime.c b/drivers/accel/qda/qda_prime.c
new file mode 100644
index 000000000000..7a709e3000d8
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/dma-buf.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_prime.h>
+#include <drm/drm_print.h>
+#include "qda_drv.h"
+#include "qda_gem.h"
+#include "qda_memory_manager.h"
+#include "qda_prime.h"
+#include "qda_soc.h"
+
+/**
+ * qda_gem_prime_import_sg_table() - Wrap an imported buffer in a GEM object
+ * @drm_dev: DRM device
+ * @attach: Attachment the DRM core made to the exporter
+ * @sgt: Mapping of the buffer in the context bank's address space
+ *
+ * Called by the DRM PRIME helpers once they have attached to the exporter
+ * and mapped the buffer into the context bank this session owns.
+ *
+ * The DSP is told where a buffer is by a single address, so only buffers
+ * that map as one contiguous range can be described to it. Whether an
+ * exporter or an IOMMU produces a single range is not guaranteed, so check
+ * rather than assume: a buffer mapped as several ranges would otherwise be
+ * handed to the DSP as its first range alone, leaving the DSP to read and
+ * write past the end of it into whatever happens to follow in the context
+ * bank.
+ *
+ * Return: The new GEM object on success, ERR_PTR on failure
+ */
+struct drm_gem_object *qda_gem_prime_import_sg_table(struct drm_device *drm_dev,
+						     struct dma_buf_attachment *attach,
+						     struct sg_table *sgt)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(drm_dev);
+	size_t size = PAGE_ALIGN(attach->dmabuf->size);
+	struct qda_iommu_device *iommu_dev;
+	struct qda_gem_obj *qda_gem_obj;
+	int ret;
+
+	if (drm_prime_get_contiguous_size(sgt) < size) {
+		drm_dbg_driver(drm_dev, "Rejecting non-contiguous buffer of %zu bytes\n", size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * The buffer was mapped into the context bank of the session doing the
+	 * import, so that is the bank the DSP has to be told about.
+	 */
+	iommu_dev = dev_get_drvdata(attach->dev);
+	if (!iommu_dev)
+		return ERR_PTR(-ENODEV);
+
+	qda_gem_obj = kzalloc_obj(*qda_gem_obj);
+	if (!qda_gem_obj)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_gem_object_init(drm_dev, &qda_gem_obj->base, size);
+	if (ret) {
+		kfree(qda_gem_obj);
+		return ERR_PTR(ret);
+	}
+
+	qda_gem_obj->base.funcs = &qda_gem_object_funcs;
+	qda_gem_obj->size = size;
+	qda_gem_obj->sgt = sgt;
+	qda_gem_obj->iommu_dev = iommu_dev;
+	qda_gem_obj->dma_addr = sg_dma_address(sgt->sgl) +
+				qda_soc_sid_offset(qdev->soc_data, iommu_dev->sid);
+
+	return &qda_gem_obj->base;
+}
+
+/**
+ * qda_gem_prime_import() - Import a DMA-BUF into the calling session
+ * @drm_dev: DRM device
+ * @dma_buf: Buffer to import
+ *
+ * A buffer has to be mapped into the context bank of the session importing
+ * it, rather than into the address space of the parent device, so the
+ * attachment is made to that bank.
+ *
+ * drm_gem_prime_fd_to_handle() does not pass the calling file down to this
+ * callback, so the session is recovered from @qda_dev.importing_session,
+ * which qda_prime_fd_to_handle() publishes for the duration of the call.
+ *
+ * Return: The new GEM object on success, ERR_PTR on failure
+ */
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *drm_dev,
+					    struct dma_buf *dma_buf)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(drm_dev);
+	struct qda_session *session = qdev->importing_session;
+	struct dma_buf_attachment *attach;
+	struct drm_gem_object *obj;
+	struct sg_table *sgt;
+	int ret;
+
+	if (!session || !session->assigned_iommu_dev)
+		return ERR_PTR(-EINVAL);
+
+	if (drm_gem_is_prime_exported_dma_buf(drm_dev, dma_buf)) {
+		/*
+		 * A buffer this driver exported. The DRM core would hand back
+		 * the original object, which stays in the context bank of the
+		 * session that allocated it, while the DSP of this session
+		 * translates addresses in its own bank. Share the object only
+		 * within a bank, and map it again for any other.
+		 */
+		obj = dma_buf->priv;
+		if (to_qda_gem_obj(obj)->iommu_dev == session->assigned_iommu_dev) {
+			drm_gem_object_get(obj);
+			return obj;
+		}
+	}
+
+	attach = dma_buf_attach(dma_buf, session->assigned_iommu_dev->dev);
+	if (IS_ERR(attach))
+		return ERR_CAST(attach);
+
+	get_dma_buf(dma_buf);
+
+	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err_detach;
+	}
+
+	obj = qda_gem_prime_import_sg_table(drm_dev, attach, sgt);
+	if (IS_ERR(obj)) {
+		ret = PTR_ERR(obj);
+		goto err_unmap;
+	}
+
+	obj->import_attach = attach;
+	obj->resv = dma_buf->resv;
+
+	return obj;
+
+err_unmap:
+	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
+err_detach:
+	dma_buf_detach(dma_buf, attach);
+	dma_buf_put(dma_buf);
+
+	return ERR_PTR(ret);
+}
+
+/**
+ * qda_prime_fd_to_handle() - Import a DMA-BUF into a session
+ * @drm_dev: DRM device
+ * @file_priv: DRM file doing the import
+ * @prime_fd: File descriptor of the buffer to import
+ * @handle: Returned handle for the buffer
+ *
+ * Makes sure the session owns a context bank to map the buffer into, then
+ * publishes it for qda_gem_prime_import() to pick up.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_prime_fd_to_handle(struct drm_device *drm_dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(drm_dev);
+	struct qda_session *session = file_priv->driver_priv;
+	int ret;
+
+	ret = qda_memory_manager_assign_device(qdev->iommu_mgr, session);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&qdev->import_lock);
+
+	qdev->importing_session = session;
+	ret = drm_gem_prime_fd_to_handle(drm_dev, file_priv, prime_fd, handle);
+	qdev->importing_session = NULL;
+
+	return ret;
+}
+
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/accel/qda/qda_prime.h b/drivers/accel/qda/qda_prime.h
new file mode 100644
index 000000000000..eb2d8cbc8cd3
--- /dev/null
+++ b/drivers/accel/qda/qda_prime.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_PRIME_H__
+#define __QDA_PRIME_H__
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+
+struct dma_buf;
+struct dma_buf_attachment;
+struct sg_table;
+
+struct drm_gem_object *qda_gem_prime_import_sg_table(struct drm_device *drm_dev,
+						     struct dma_buf_attachment *attach,
+						     struct sg_table *sgt);
+struct drm_gem_object *qda_gem_prime_import(struct drm_device *drm_dev,
+					    struct dma_buf *dma_buf);
+int qda_prime_fd_to_handle(struct drm_device *drm_dev, struct drm_file *file_priv,
+			   int prime_fd, u32 *handle);
+
+#endif /* __QDA_PRIME_H__ */

-- 
2.34.1

