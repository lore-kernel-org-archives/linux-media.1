Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DE389458
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573957; cv=none; b=m+XlI03qAfsksOqyNYZWDkOCxO2xXlclFLG9ry11kkZsKpf3Jx8k7SryMJnoY24d+ie1GPvc+h/u6hl1E7oBnVDXKzTrkSB5AOEvgAnW7AfHoczx1S/DPJiZmIzxpfbqspSaUxQE7nVB76lZqhQqt9Bh2DITXzBAxZyrsT+iZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573957; c=relaxed/simple;
	bh=PAtF/PNKxtMzgWanGm0UJ8I09oPtXYVfYF1UgrzHWr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=owSJmq4nqYfJAUWGkoSPovfnbo7hDRKc2Eu4Bs1CPZbGMNOAGEcNgSd9/l01qShN2gfUQHoayWRJFG5q+KdpIOmfW55oSczBpDLVZyY94JZT1ZBrUiBO2+CBOFZMYkMm6pQAomKrGPxxnhoWak9fGhV6tvYLdsSVIBdlHNehJlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgSu7xmI; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgSu7xmI"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86dba3e584dso75930b3a.2
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 22:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790573950; x=1791178750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1GfyXNzZ7U9i0Z+Tk5I9ck9dnyRvvtvnuEFHqewoGY=;
        b=AgSu7xmIqIAlSTHT3IA2u9M9XUCC9OEnJ8npB/mFKwI0Lzj+ZQ0qUnAadbkRFreDDN
         tO2AA6dbpjBA5ns3agePT+anxLq8/WNWigA1GmyNU8084R2V7XxlSgJ5wA9uMOLpZRDY
         g71IggMSls3XTU/Br8HzMbsC/yysvuMQ2pGu1REcQltdx4IkoC1HShVsZORjfcF27I6T
         qDCMjWy/HMoSScEv98NIsLpQS2F0BFVd/ZwlloHBFMUfncdGvZDl8wwibXAWcQnzPns+
         TeZNSF4cCNNznjmGJzis11ALp2K3Yqwr5bkarlbDSlqcR9fN2NvgaTdLeLsrGteJYhMT
         UeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573950; x=1791178750;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1GfyXNzZ7U9i0Z+Tk5I9ck9dnyRvvtvnuEFHqewoGY=;
        b=ju5jT4/RFK7SqDjQVX8qjOEZ3tKB0q/FQGjziQY2LdduHjuSJQrLGiKhZZP2NDveW+
         DM6EL/EoNKAF5+9IkHbT7MGoDTg7gDRlYxxKYWFRZvAPG2/Pfdzioe0bCgMbbuvJIV+S
         uJ4cKSODS843zjhbHNpCM2a3tka0kqplQHholGCAKkxcyLt4mu/0sBAGNHJAQKIf9sUs
         8AN9KqL2Zf4IA7ACIa+D0M1FsMoLff1wQxvtmWTqk2aFcCOLeZnITsIv7KGUfUOassuf
         NXaiKgALA/t6AB/pt23z0uInNJxIahWStunyrSlidXr/xiYM7//bxfF1ffUcEDgFLun5
         iL6g==
X-Forwarded-Encrypted: i=1; AKwUvBwt+PeX9fH/swbd32mBi0bce3ircOvG2ZAkd2rdEZlvRUIj7Cl1+V20OgEGHiF/XZzLoltWCyXNl8289g==@vger.kernel.org
X-Gm-Message-State: AFuF++k5JKT4+w8RuQvebAiHkaEge7iGNFOWpyxI61nL1bH1y/D+6hAo
	ec0NBdlcT2WC/vkhLUeR5H9CtG/CrLoI5ufzzCJgMuROxUl33QS2RasS
X-Gm-Gg: AYBFou3C9T6fHqFBOHC6ecDPLNAwP5RZMw+rilBeVN6MnitQsF6ll69nz6VnAde24lh
	yonP6ViArHj1jV7HiVHan7FxNcVptwlfwnhlQ5aI/vnsixxzmV2sJhORIFzfn8lV5N2gTliwFQZ
	rvFt+Ox9l2kVFZRXi6XcEJeRIh3O6Awar+02v1ToSWg3/xp5BdH11tA4UcNzkt/nI0yi2RNXfsA
	Q8A1S2wAlfyPEpYKIUm2JhvRxShO+hYK/ZQ/e5/3GF9B0uRezMmnEfNU/xaoUw/6bKp4r617xg3
	x4WDIA01RFpUEgzUdQvxWwX4sZuc1MfDI9nB5sE143/HhDYfOLYUK0b6In37a6V4LTyAEApO98I
	zF12sX6e8RAzs5TC90fHtg2I8Mrp0THXJYitt9rgdhTIdPlWvy/jdPnXQXzhX8WXUWfTCSrG/H+
	6vuR5/ptkxeq2MGflJMvAS9kqiuHGITIO7uivEavQkrLdduWWXEttSCj37gcm5bb85WFv5HWQYC
	3a4z6hDb9MVVw==
X-Received: by 2002:a05:6a00:4807:b0:864:59e2:2968 with SMTP id d2e1a72fcca58-87fd0d8cbc6mr6922416b3a.0.1790573950242;
        Sun, 27 Sep 2026 22:39:10 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87febb82357sm3591121b3a.61.2026.09.27.22.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:39:09 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v1 0/2] drm/msm: followup - map page-less imported sg_tables
Date: Mon, 28 Sep 2026 13:38:49 +0800
Message-ID: <20260928053901.7270-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi Rob,

this is the follow-up I promised: it fixes the two remaining map
paths that still consume struct page/sg->length of imported
sg_tables, and therefore completes the DMABUF_DEBUG=y story when
applied on top of your series [1].

Test results on x1e78100 (Snapdragon X1E78100, DMABUF_DEBUG=y,
kernel v7.3-rc4 based), which is the machine that originally
reported the UCHE translation faults and the one hardware test
environment for imports of buffers not first exported by drm/msm:

 - v7.3-rc4 stock: arm-smmu UCHE translation faults during hardware
   video decode in clapper/chromium (bisected to 143755bdabaa9)

 - your series alone: video plays via the userspace copy fallback,
   zero GPU faults, but a WARN storm from __arm_lpae_unmap()
   (472 traces within a minute of video playback) - every map of a
   page-less sg_table silently maps nothing, so the matching unmap
   finds no PTE and WARNs.  This matches your cover letter saying
   the map paths are not addressed by the series.  Your patch 2
   ("mmap imported dma-bufs via the exporter") in particular works:
   a test importing a linux,cma-heap buffer via
   DRM_IOCTL_PRIME_FD_TO_HANDLE and mmaps it both through the heap
   fd and through msm's GEM mmap sees the same memory through both
   mappings, including writes visible in both directions.

 - your series + this series: zero arm-smmu faults, zero io-pgtable
   WARNs, and hardware video decode displays correctly in clapper
   and chromium.  The GPU per-process pagetable path is exercised
   with real decoder capture buffers (videobuf2-dma-contig, 2MB
   frames) and maps them from their DMA addresses.

Patch 1 exports iommu_get_dma_domain(), which msm needs to look up
the dma_addr -> phys mapping of imported buffers through the msm
drm device's DMA-API domain.  On platforms where the drm device is
direct mapped (like mine: ae01000.display-controller is in no
iommu_group) the lookup degenerates to the identity; on platforms
where it sits behind a translated IOMMU the translation is needed.

Happy to rebase on whatever your tree looks like - and I can rerun
the full test matrix (WARN count, fault count, kmssink scanout of
real V4L2 frames, chromium/clapper hardware decode) on any revision.

[1] <20260926183051.25754-1-robin.clark@oss.qualcomm.com>



Jianfeng Liu (2):
  iommu: export iommu_get_dma_domain()
  drm/msm: map page-less imported sg_tables from their DMA addresses

 drivers/gpu/drm/msm/msm_gem_vma.c |  9 ++++
 drivers/gpu/drm/msm/msm_iommu.c   | 90 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h     | 13 +++++
 drivers/iommu/iommu.c             |  1 +
 4 files changed, 111 insertions(+), 2 deletions(-)

---
base-commit: d6882ed4e5b3970a13d721a07d2737c4831cdced
branch: msm-map-followup-v1

-- 
2.47.3

