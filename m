Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794043489;
	b=J5ErAtO0GM6JsxbuK/mDMbuXDK376R0QubjFGX81qh5sqIKbFh8kLO6DpE9GGJ+g3Hep
	 b7qm8MMcHprFfjIEDTkwglBlVfglTLxXvAcF4KyiCPJF2bKVIQ4pj/wWU1L6hEPj7CyX2
	 3ZgPeg435yhxsZRV+fOf064/CWTu64VJ0rzoAlxYvo7CTB33cFn9HnJrMCCdGGH5mZxRB
	 YvQbpgY7GZWbCJtJOfowATPZpJ4tu50XNGIcUIfhaj6ZnUb4CoDoQrZxmWLmt4r2Wf20q
	 ZABfRx6Y8+mkLgUbdf0IeYeZX321Et2jmk+G9QBPRwaXRIui2d+OL/ucXPQAtZ+X4PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794043489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
	b=OKtnyqH9qDP27HNhJrEfcB9Yl+XNTH7QXN+6UX/jq1SKkrN9XXt0aUNlAph96FL2AmWp
	 I6wnQJKE9KEVgK12hk0JfbnDHFSDAUrncEdurlxJQyIBKmy7O/LUJLIM2bFoDY+Uqc/Qv
	 sgHeEtveOqEXQ0VAJglt5oDc9g7oWbLVrrk9Eu2U4dmUa+eaiK1QF4iaPuFRD0QGb/Mfx
	 9KpOPl2mMryrjV2e0bb6h7yZpOKPjAODMVhoI1a66wGwFWzAGIesBFzrqOZKKkvH4F4f1
	 IRPzE4CW5eOcrTu1Ioxnghv9VIk5vpBLm41nrQeCrZ6nmB4eHFexAKc2GHLLja7biMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKRf62T0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5FC606A32C
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 09:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKRf62T0
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso399452fac.2
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 01:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794043488; cv=none;
        d=google.com; s=arc-20260327;
        b=LIjfkI17Gs+ewPvHSNXX+EkXccX15or1PbAuL1ONlxey0x9awfbHZR22FrJYbzZis4
         SqkVYPk3zzeNieNiQMvay+pmZFNletp3kJgPOfqABxdtxWzhG38SkTEw2e5hp1GqHE5m
         aj/dVKP5MKWBCBDeYqCa5djnLrT9c/hQxptGCeOS2RIrhwTA4YGV5IONvFkz2VRmHxWo
         I/t1NIVYK4FgX4oPBEOVh4QsxSP6yK0FlaShSktULmWVPG0Kb7an1WC/ZA5RTROkA5LM
         o8aZqW1G1lEnzi7vsAcaclKTT50e5dTCTUX76uMJq73b1FHFtpzD/SKG2C5LFw51JiJf
         ZPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
        fh=20cXDr6TxPh4WG+Uxi6OP8xWB6tC7W5Bhg8qQ3fJwP4=;
        b=D4WSwr5kFUz2tb7mut17viU3PbHiy5eLVbwvdc3BaWHdBKVTvtqNqlxETWRzOavW70
         Jqbvvl6+M5IlFvCOS98L8OS0xKKILap3YSS0KlyaleSeMQdXw6UfkVr6QwsydKsq4P9i
         kmZj0/Zwfj+Odu6tGUmZ/0NLeLDwYbnt3OD0vLJ+Xyj8lNklNNqfgNODo1gUWCslojg3
         Cor4ano3fmEO0HbvlWY1ry47GdxrWSorD6ba9iE/hu6n8SdQ3JGfKUAfoVX0Nz2EXBem
         1Sj7cydw76w4QgZKlF5RBTXQvK8in81MPFQhWP0ENaQ9KckV8o9uIldTAb44zCald2LJ
         TPNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794043488; x=1794648288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
        b=dKRf62T0qDchXjN7y+3oYgItIUBw4g1wOVebySojyArE5WrnJkLBtygXKAlQMmAvZm
         kdFOrYwoB7UAttCcsl1YTPMs72CKId+u00yjTJgIhZ3uBIcRU88RPLA2Yr40t9cHWy3G
         dbf//uJPrVgjxTfI4dZzKh9MufpLsSorH2scs/XaB1mx1wop8OzYjvwM1uD/vdtXt45p
         P/CvVRegJWAfAcBhATsMy/NC+FdF72PISsB0bLC81+KTb5VhQ/ejLnvo8CX+R2M0TEje
         I1+6vdAqk32Rq2F8b03cZ0YH04HzSDSKrfCsVo+GjS3nVFcyuMKOoe31iKAlWmPn3Lpy
         Rcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794043488; x=1794648288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teIWFoxvai1QgmA58nk8sElOSZ5xnCHuXb5DRKtxj7c=;
        b=vtBn35i+vKfcwN9iad1aHri6F/Z+q6meIqkCVvsHxLQJhQ4W07yOVwWv8qkIVw5Zc4
         Bvh7k8mVAeCqzSzEs0wJsBdtznDQFeKF+F6tuNFdp3AtqwBnKtM7QD5gH0pY1i7bSPo/
         dxVGgVat/NRtI0XUHeLASeOKWNJliymtlNoSgEKyQsNf5VKSEJy9GqYf/mwc7/P1LR8F
         7g9V/G+U3PojGxKLktU4SMkPXAVFzLAMorA6X74tL5DgeeYIMOLZBJ/vdbd8JD0Kh4P9
         wvbtWYSz1R+VDVm8fxEdK2T6eXOwj4uX2CBYn2k2CAgu0KbiF8tupRAHyP1heWWTJzGa
         4QqA==
X-Forwarded-Encrypted: i=1; AKwUvBwSw46lOcecnoBayskUbrjTmafnJyGVu66yeJ/5LoBqfniabyDKq7jMfYIxwWhhLbGJMU17vNvuIKfQaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z//kKw6q6lu9j73hSUfLvy9osHuIIXgA+MFkewzgH9t7H3wlmAJ
	Q1FKXdctTs7KbqxjL/GJ7TaeY6gKK5ekNGk9Uco5/0IAJxcFLGsEsWJQWtuKjRo9cgzjYzPqWpN
	K/eBZRDkw4VkQ0VTG8DHuYrlD/KBKgWM=
X-Gm-Gg: AYBFou3kM3LpIzbc3QG3UskhsJCYpGLls+vWNjLyhNVrRQgsqG3zwxeZ0Arfsp9rfcd
	wbwwvGUFWqtrS4yl9zxasiVszlUIOVtkq09JBmt2oqh2yfbiP3yIlaNRZzdClyfe43qQW8gJheQ
	5x34SxfKHBjmIA93kbXYIDns3hBuOj/Z+vNthqvYLWILvFqGTIVhmm0+dTbwnPOvb6YVza2noGZ
	gKW1x2u21LFvJoIB1EVpc89RvoDxnTfh9ElozD0rxij32gcfx+pHWX15dCCOQd7bNzL8l6VRIcu
	SwUGb4DoYg2p09x7CHiXcYhiZIuOaYR6p7We/6wItmBgahmt2xGKoRWY9TQ+5jLOQ+fbQ//4Wqw
	JsNKkW5VryKcKAau4vh/Fvb50FCwN8ZsoiRw=
X-Received: by 2002:a05:6808:1246:b0:567:cbf5:bbab with SMTP id
 5614622812f47-567e14643fbmr3397829b6e.60.1794043488173; Sat, 07 Nov 2026
 01:24:48 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
In-Reply-To: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sat, 7 Nov 2026 10:24:36 +0100
X-Gm-Features: AclHuK_3rVhhaI0Q0HYZNd1pYmMhMO7iRMGrNGROwjLOJBeK6Hdfo1HdSx7nPEI
Message-ID: <CAMeQTsZAfgfBadAV28-k9jmKoqJi03xghmnAqUwK8Unzd8JEsw@mail.gmail.com>
Subject: Re: [PATCH 0/2] staging: media: facetimehd: add driver for Apple
 FaceTime HD camera
To: Carlos Alberto <carlosalberto4ti@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl, 
	linux-media@vger.kernel.org, devel@driverdev.osuosl.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:43=E2=80=AFPM Carlos Alberto
<carlosalberto4ti@gmail.com> wrote:
>
> This patch series introduces the facetimehd driver to drivers/staging/med=
ia/.
> The driver supports the Broadcom BCM1570 (PCI ID 14e4:1570) PCIe Image Si=
gnal
> Processor found in Apple MacBook Pro, MacBook Air, and iMac machines (spa=
nning
> generations from 2013 to 2019).

Hi Carlos, thanks for working on the driver.

I don't mind people using AI for coding but I don't think an AI code
dump is the proper way to upstream this driver. Multiple people have
approached me recently on wanting to upstream this so my plan is to do
it myself. The problem is that we have a high stream of mostly AI
generated fixes queued on github. I would like to handle those before
submission.

>
> Historically, this driver remained out-of-tree primarily because it lacke=
d a
> redistributable firmware binary and relied on extracting proprietary blob=
s from
> macOS recovery packages. We have addressed this blocker by developing Ope=
nFTHD,
> a 100% clean-room, open-source firmware (GPL-2.0-only) written in freesta=
nding
> C and bare-metal embedded Rust. A separate patch for linux-firmware adds
> facetimehd/firmware.bin.

This was never really the blocker. There are other drivers in the
kernel without redistributable firmware. Our current script would have
been fine.

I had a quick glance at the OpenFTHD and it seems rather simplistic
for what the original firmware does. Did you only include code for the
sensor and not the ISP? ov5650 support is not included in the mainline
kernel.

-Patrik

>
> Key capabilities included in this submission:
> - Modern V4L2 and videobuf2-dma-sg implementation compatible with Linux 6=
.12+
>   through 7.0+ (removal of deprecated vb2 callbacks).
> - Seamless PipeWire and Flatpak streaming via in-page USERPTR offset supp=
ort
>   (programming obj->byte_offset into ISP DMA descriptors) and chained sca=
tterlist
>   iteration with for_each_sg().
> - Discrete framesize enumeration (1080p, 720p, VGA, QVGA) and matching
>   discrete frameintervals for WebRTC, PipeWire, OBS, and browser capture.
> - Native V4L2_PIX_FMT_YUYV pixel pipeline with power-of-two 8-pixel macro=
block
>   stride alignment and immediate Auto White Balance (AWB) on channel star=
t.
> - Hardware ePTZ digital zoom (VIDIOC_G_SELECTION / VIDIOC_S_SELECTION for
>   V4L2_SEL_TGT_CROP), executing lossless sensor crop without host CPU ove=
rhead.
> - Auto-Exposure Photometry Metering (V4L2_CID_EXPOSURE_METERING: Average,
>   Center-Weighted, Spot, Matrix).
> - Wide Dynamic Range / HDR (V4L2_CID_WIDE_DYNAMIC_RANGE) tone adaptation.
> - Camera status / privacy indicator LED control (V4L2_CID_ILLUMINATORS_1)=
.
> - Runtime module parameters and power profiles (High Performance, Balance=
d,
>   Aggressive Low Power sensor sleep) exposed under /sys/module/facetimehd=
/parameters/.
>
> The driver has been validated on physical hardware (MacBook Pro Retina 15=
-inch
> Mid 2014, MacBookPro11,2, PCI 03:00.0) running Linux 7.0.0-14-generic,
> streaming cleanly at a steady 30.0 fps in both native V4L2 and PipeWire
> (GNOME Cheese / Snapshot in Flatpak containers) with zero dropped frames.
>
> Repository & Upstream Pull Request References:
> - Out-of-tree repository: https://github.com/patjak/facetimehd
> - Tracking Pull Request: https://github.com/patjak/facetimehd/pull/368
> - Active branch with test suite: https://github.com/programandosolucoes/f=
acetimehd/tree/linux-6.12-compat
> - OpenFTHD clean-room firmware: https://github.com/programandosolucoes/op=
en-fthd-firmware
>
> A TODO file is provided detailing the roadmap for graduating from staging
> into drivers/media/pci/facetimehd/.
>
> Carlos Alberto (2):
>   staging: media: facetimehd: add driver for Apple FaceTime HD (BCM1570)
>     PCIe camera
>   staging: media: wire up facetimehd in Kconfig and Makefile
>
>  drivers/staging/media/Kconfig                 |    1 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/facetimehd/Kconfig      |   16 +
>  drivers/staging/media/facetimehd/Makefile     |    5 +
>  drivers/staging/media/facetimehd/TODO         |   18 +
>  .../staging/media/facetimehd/fthd_buffer.c    |  125 ++
>  .../staging/media/facetimehd/fthd_buffer.h    |   73 +
>  drivers/staging/media/facetimehd/fthd_ddr.c   |  670 ++++++++
>  drivers/staging/media/facetimehd/fthd_ddr.h   |   30 +
>  .../staging/media/facetimehd/fthd_debugfs.c   |  198 +++
>  .../staging/media/facetimehd/fthd_debugfs.h   |   17 +
>  drivers/staging/media/facetimehd/fthd_drv.c   |  600 +++++++
>  drivers/staging/media/facetimehd/fthd_drv.h   |  133 ++
>  drivers/staging/media/facetimehd/fthd_hw.c    |  712 ++++++++
>  drivers/staging/media/facetimehd/fthd_hw.h    |  128 ++
>  drivers/staging/media/facetimehd/fthd_isp.c   | 1483 +++++++++++++++++
>  drivers/staging/media/facetimehd/fthd_isp.h   |  768 +++++++++
>  drivers/staging/media/facetimehd/fthd_reg.h   |  184 ++
>  .../staging/media/facetimehd/fthd_ringbuf.c   |  135 ++
>  .../staging/media/facetimehd/fthd_ringbuf.h   |   44 +
>  drivers/staging/media/facetimehd/fthd_v4l2.c  |  881 ++++++++++
>  drivers/staging/media/facetimehd/fthd_v4l2.h  |   34 +
>  22 files changed, 6256 insertions(+)
>  create mode 100644 drivers/staging/media/facetimehd/Kconfig
>  create mode 100644 drivers/staging/media/facetimehd/Makefile
>  create mode 100644 drivers/staging/media/facetimehd/TODO
>  create mode 100644 drivers/staging/media/facetimehd/fthd_buffer.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_buffer.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ddr.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ddr.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_debugfs.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_debugfs.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_drv.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_drv.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_hw.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_hw.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_isp.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_isp.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_reg.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ringbuf.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_ringbuf.h
>  create mode 100644 drivers/staging/media/facetimehd/fthd_v4l2.c
>  create mode 100644 drivers/staging/media/facetimehd/fthd_v4l2.h
>
> --
> 2.53.0
>
