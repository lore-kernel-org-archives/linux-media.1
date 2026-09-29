Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3C38330E
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790642376; cv=none; b=It0grk1o0KKiFtNSXpXhz+X1TyUxQCqb10Xu0QRe3mCJsiTSQrng+yeuIgBB8jKugYCN/rnHWtL9giOu0YBf6GpXMff1n1pwFVLwMa6JJISK8PLukj0Z8FThyrv6olM2CmFdmxB70Br3jNVVdvehc2EbokXnGv8IHgNEchJeFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790642376; c=relaxed/simple;
	bh=Sc6B/LNjsW2P4eo1apjanbcfJFhHR1I9fnaSFJ77sbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=szS3PN9v1xu8/6erBFAWt+qsEUFeS8UcAC4cNKH3dxMtN8iFpAKU1/EAYX9UgPDc5MGTnDp8Zpa/fcABV7a4IRLUzVVeCDlx0TgwM5saK9FLTjFXJjuqQhbDcgRmI1OW33X/fU1HUsuuxGsmj+tWoJFWnQlC2trMsn6hGX/LisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=poJoXiiP; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=L+CpYa3J; arc=none smtp.client-ip=67.231.153.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="poJoXiiP";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="L+CpYa3J"
Received: from pps.filterd (m0119691.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SLfCbC2400595
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 20:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=Y5kiEK+5yijCN+GrhEmUOii6QxUi1ESRYSOq
	TD/Fb60=; b=poJoXiiPqy+J/el0cYDyqK8Ze2Cum7LNM4/g7VG7bXAp0Yr1hxi7
	c8D8EncRNEIusvz2X23KFc7NGNgCIQX+zvlC5WKZaqvI3tbva7GlsncBz/ea9L7Q
	UBt2Sh99RRdhPsoSfyRACCSh8be0r8wLHbcB2DCTK8tXrE1OwKGSVLkf31URCxH4
	wCkZ6ewkaR1IITHFKnmEd8szTbfrnGIZM0hnV5dTGEzWwODX1z1LmU7TmqPm/dxQ
	NtXj5025iY+gFtD37sQ8IyV+IEnb+au6vInEdI9KDzst00rVs2C8g1mceBlUYn1H
	imi+EZb9P+cucHiKg6iTDP9BCSV8T3hM0Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4h00ccst7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 20:19:19 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104eedb5b0so78469526d6.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1790641159; x=1791245959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5kiEK+5yijCN+GrhEmUOii6QxUi1ESRYSOqTD/Fb60=;
        b=L+CpYa3JiDfksyp6gdoHqeA53Y6qqWGZ0ciHegEmuLi1wbyUcONEv3urexHEPBn8jU
         h4O5bp9e3a9JYwsxLTc+vFPvD2eOK0ylf3QBAVj3lOvk6u2I88izMrHzq/T0pGiT3Jhz
         DvvhP834LLUDVefhxxSkX3u8cRRebhfdQYp+yix9yYXLv3moHMTfjf1PJUXHbHi+DOjQ
         tdeP95Z0OP9d2Cb+wV4cBw2tqB/KYH8+mVlVeg5vPoYqu5H5kSetmldMZFSCiBreOIkZ
         CMDfS1Fs/aJouhlEX/MMNMcLwMiaRYRhheRwNQqo3tg482Ia+nFycEVWRyT1nkmfU6aW
         TMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790641159; x=1791245959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5kiEK+5yijCN+GrhEmUOii6QxUi1ESRYSOqTD/Fb60=;
        b=ggjcWk/WIFPFIDl4knRLZ7ACALJtGmNSSR1VNSvFpG3Bl5o7MG7RV+Ya0nz0dxEQYv
         +PbwTtK5/MXTCrZZKLcJhJlaFfg13YplGHo4LSMXqqI95P3dtbLOvHWlNreW/jZ0xMhr
         TZYwLAOYsp5uBz0BA/qpHKVASkj52A8+xYOj5I1cw0azGUypnBduag9tNDfk4hAoUlZs
         zr72B+h15FBLjY6TT53ggL55nzulzCWL7/u/k21oDcD1ONEWJbc2v6AkY+akrKZzMbvg
         RDSf9xzwh+5VXg6dMphkOBUSN0xwspyDNGLs5wsxAdnz/E8os6mDFN6QTIQSph1ms84b
         hq8A==
X-Gm-Message-State: AFuF++lLokK35hiT7FrrYRc1UAOD1T9Jg6C1CEVBe9wkfYY64OzQAPEB
	Q/2coN8mX0zIFq7xp2urXsSYf+R+O/Bb7tdiosY03meZ5wizJjAKN3/A71fBvDww3V40kh0r/jw
	a8ZcVoU24FUwKqpa0R8wpd5S8Bf3LrQI91eK5lmx8VDE0kRuKYj7xBYrIebR15Q==
X-Gm-Gg: AYBFou0wA5ChCFifPYamoi140PoEhlujaFC+tF+eGpTvtdmroMuVDDvfvFkkgqEB87I
	ELuzexT28o+YCwtx4Vh0s2evj8EBPp5RmO/SzN/t/D3EmPhPxlc5rfqXgbm0Kk9GFbcBIeikFBR
	EHXLQ+siTcHxCKlEiiecKVzk/Skp7oqn2VWhZi/XyIyzmtog+1E6FtJ5FrVGeyPMrmDJs64vdGK
	bgZH5lzoA7dCLxyripk5dBSNSHtWwf3g9HLQBZojvx27nvqdAVX+w/iINK1HvcPaLbzY2MI4rc8
	aMCtNooiU+X3JWG8YJsUjVwIV59mt/BClhI5hxSkYIf1G4MBKcQiWyNeUrGbzHoav6eciiLWMs6
	6pCoMcof35Tgsn7VEsjd4ZsaNAiVBg8yUJls=
X-Received: by 2002:a05:620a:6c0d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93c43d159a1mr2514690385a.47.1790641159303;
        Mon, 28 Sep 2026 17:19:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93c43d159a1mr2514686685a.47.1790641158775;
        Mon, 28 Sep 2026 17:19:18 -0700 (PDT)
Received: from jerrythepro.nyu.edu (216-165-95-162.natpool.nyu.edu. [216.165.95.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813fee09sm270338085a.24.2026.09.28.17.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:19:18 -0700 (PDT)
From: kj2864@nyu.edu
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+6a04efcebe0fc0ce@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH] media: em28xx: fix double free in em28xx_alloc_urbs
Date: Mon, 28 Sep 2026 20:19:04 -0400
Message-ID: <20260929001903.158767-2-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAwMCBTYWx0ZWRfXzuCfwwvZ5ITD
 6734cBddnpHMHrpsuy20ICeAnc8Cu5wzH8GOTTwFMIyKONE793ZOCCWm/sX1wVhB0/4QMkvF9jN
 zf3cJ0iYg4O2l/ravQFyH4BsJML4luL5H9MnkeTGnn9FJZg/sBxET/g9yKz6Z9Vpe4uQCm8+2cy
 ou9BW7jnhh1Y31ZIz5WgPFZlglH9bBO6qjkcmnep3zuyRobPQH/Mbpq8BksM+3tm6SGIHelSWSX
 eLIo7Owc7SjJ/Q5d0I92wCCyhfnIpwnXRgn02maI3P44Ccq2Z9fI4+ZT2XRkHqUPFdKZ98aKVDX
 N7CXZ1PBHkRbo1Ep0uD/3+aPbarG+OQT2DmjWTYv+0z9TAxqGI0ngg5Tzg2R9Q5ueT6CeGQq2Ap
 zIpb+GtfwSjaN5FbDt1oxDkRlKklSJJcBWdEcIhOb/df+1QW5dAg4IPPu1Sq4LgCUUPJA69epNg
 zW4YMRNnUX9tTIwqgpA==
X-Authority-Analysis: v=2.4 cv=OYMNnRTY c=1 sm=1 tr=0 ts=6abb0407 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=QttKoHjxDjZciDcJ6FphuQ==:17
 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=tr4woWNwjDflhTIOjkZU:22
 a=VwQbUJbxAAAA:8 a=kj-zqgMp3CcBJFKlVqoA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: kC5zckbKw4U9pDpD_fRd9bCd7lzu7HBQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAwMCBTYWx0ZWRfX7O7IWVUcPfdE
 HK7Ft8RIgyRRISUr/NI29/DqzNgxDGzWdCu96BKdNmXjm1ZejxuGxOc92PNBHKIs/iKQU7ThuvF
 XdjnlU0Trr9OKgq6qxjFtqSJbrtf+II=
X-Proofpoint-ORIG-GUID: kC5zckbKw4U9pDpD_fRd9bCd7lzu7HBQ
X-Orig-IP: 209.85.219.70
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 spamscore=0 clxscore=1011 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290000

From: Kaho Jiang <kj2864@nyu.edu>

When allocation of usb_bufs->buf[i] fails, em28xx_alloc_urbs()
explicitly frees all items within usb_bufs->buf before calling
em28xx_uninit_usb_xfer(), which also frees these items, causing them to be
freed twice.

BUG: KASAN: double-free in usb_free_urb.part.0 (drivers/usb/core/urb.c:25 ./include/linux/kref.h:65 drivers/usb/core/urb.c:96)
Free of addr ffff88802fd37c00 by task kworker/1:2/1182
Workqueue: events request_module_async
Call Trace:
  kasan_report_invalid_free (mm/kasan/report.c:557)
  check_slab_allocation (mm/kasan/common.c:235)
  kfree (./include/linux/kasan.h:199 (discriminator 1) mm/slub.c:2693 (discriminator 1) mm/slub.c:6508 (discriminator 1) mm/slub.c:6801 (discriminator 1))
  usb_free_urb.part.0 (drivers/usb/core/urb.c:25 ./include/linux/kref.h:65 drivers/usb/core/urb.c:96)
  usb_free_urb (drivers/usb/core/urb.c:95)
  em28xx_uninit_usb_xfer (drivers/media/usb/em28xx/em28xx-core.c:964)
  em28xx_alloc_urbs (drivers/media/usb/em28xx/em28xx-core.c:1076)
  em28xx_dvb_init (drivers/media/usb/em28xx/em28xx-dvb.c:1734 drivers/media/usb/em28xx/em28xx-dvb.c:1698)
  em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
  request_module_async (drivers/media/usb/em28xx/em28xx-cards.c:3685)
  process_one_work (kernel/workqueue.c:3396)
  worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  Allocated by task 1182:
  kasan_save_stack (mm/kasan/common.c:57)
  kasan_save_track (mm/kasan/common.c:78)
  __kasan_kmalloc (mm/kasan/common.c:398 mm/kasan/common.c:415)
  __kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5414 mm/slub.c:5439)
  em28xx_alloc_urbs (./include/linux/slab.h:995 ./include/linux/slab.h:1312 drivers/media/usb/em28xx/em28xx-core.c:1081)
  em28xx_dvb_init (drivers/media/usb/em28xx/em28xx-dvb.c:1734 drivers/media/usb/em28xx/em28xx-dvb.c:1698)
  em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
  request_module_async (drivers/media/usb/em28xx/em28xx-cards.c:3685)
  process_one_work (kernel/workqueue.c:3396)
  worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  Freed by task 1182:
  kasan_save_stack (mm/kasan/common.c:57)
  kasan_save_track (mm/kasan/common.c:78)
  kasan_save_free_info (mm/kasan/generic.c:584)
  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
  kfree (./include/linux/kasan.h:235 mm/slub.c:2748 mm/slub.c:6508 mm/slub.c:6801)
  em28xx_alloc_urbs (drivers/media/usb/em28xx/em28xx-core.c:1084)
  em28xx_dvb_init (drivers/media/usb/em28xx/em28xx-dvb.c:1734 drivers/media/usb/em28xx/em28xx-dvb.c:1698)
  em28xx_init_extension (drivers/media/usb/em28xx/em28xx-core.c:1248)
  request_module_async (drivers/media/usb/em28xx/em28xx-cards.c:3685)
  process_one_work (kernel/workqueue.c:3396)
  worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)

Remove the explicit cleanup loop and let em28xx_uninit_usb_xfer()
handle the cleanup.

Fixes: d571b592c6206 ("media: em28xx: don't use coherent buffer for DMA transfers")
Cc: stable@vger.kernel.org
Reported-by: co+6a04efcebe0fc0ce@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 drivers/media/usb/em28xx/em28xx-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 5bbb082dbed9..86c74c55908c 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1080,9 +1080,6 @@ int em28xx_alloc_urbs(struct em28xx *dev, enum em28xx_mode mode, int xfer_bulk,
 
 		usb_bufs->buf[i] = kzalloc(sb_size, GFP_KERNEL);
 		if (!usb_bufs->buf[i]) {
-			for (i--; i >= 0; i--)
-				kfree(usb_bufs->buf[i]);
-
 			em28xx_uninit_usb_xfer(dev, mode);
 			return -ENOMEM;
 		}
-- 
2.43.0

