Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE03BE161
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 19:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909396; cv=none; b=eOLCnc1Ji+AKWnwNVqixGfpI8JWwNVbEVDiPHune7OAFO4Gea0LhqDHVFK2OGMF4TObKXL75oy+1PBthI9gYV99WoiOGkaY9//GLKevbT4TQOS4vy8rrOOzVGG9ATE9mMdhKVLk8vlz8APukhcwxW+ieRxur8mpQSZF2LxTrFsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909396; c=relaxed/simple;
	bh=3qQgQYdRrm0M4fuEMAsAINqVi6vOGVxvVXvEOdAkUws=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K7sMmSEsIceB4jHpkfrO2eSuSQbYG9ru5fnPwQLSTD/AUe5m9Xh9zOuGatXa8cJkQ29KPykCkhuh1KxYyD440hzqwCvXwLRK8TeuYOCrL30V/2cwJRybqN9yO5WHQgCQJtF8/l4DkYZJHapHFdcghXe2cogYMUjvX/pVauRPQqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOuUHhgj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOuUHhgj"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3062078a91.2
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909395; x=1787514195; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ydLps/ZPHHAYsp8FMI46WDrtPvUmvDidY0XGhqyT6ys=;
        b=kOuUHhgj7zG8AIqUFO8dxmTBYC4ywsSBFVl+J0vFlTKUkrohIStxqr5WNCV1RHdSy1
         3uQrSluZlSK99TVPfBQZDZvE4NnKiNmYFQP/Ck/WUjQR2lz8RlR6HUURl4vkmb1FcutV
         EDQWwJFg9sqUAI569JYP/Bap0U62ANQl05c3XmYfPV5qfyj2++FNj3Wu9VDsnmqTY11b
         G9DFD6BaK2No/quRHDIz3ZrzWF1T9sSQ27ZoNXqpbtQLKRxWBX2/qd07O/CloqD3I03Q
         L0vUVjdkn2m10fNl5EQKc6LysCtuLevTRbtp0SYqdM3xzeo/Y7y9XdfKzgl9Bm+X93pW
         dK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909395; x=1787514195;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ydLps/ZPHHAYsp8FMI46WDrtPvUmvDidY0XGhqyT6ys=;
        b=sYnapweCeWBOCozOzqxGoSyloe1XQy0ucw/+619DuUS8ngE7Cv8GyNgH3jwYnBdXuf
         W/eYBMO09ln96tWeK8sWfJcmIHV+nb8S//quzHaI5ANyd0c6N+gF4RbNZLiECn/N5lfW
         hqYrdDM6jyk4j26pX/C2VNq/SEk6q2xNg6WZOD5USQ8+SShm7RBUVUwrtZ8Im+k2oMoP
         D7z0duAmJlveqe+wjcsXzvtOvBM7OarZ6QJD6r/X8f1GaQGqnbVbXJUtBaOLXwSnFVjy
         ggskSRei3giTNvyW6JhQ0ughoz1aedJKT+kVALCHlVQxsig1qIeBwipgIdHimx/wJ/GH
         RY3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr09oFAwNZC/ZfPAgpXZHt10SFiC8Oby02WBpXrZu225JHJs4bDssAC+yZsERB69Dt3JTfiLDafe14R+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1qKyBbwTGkOkvcvwrPN/7T4jZ/ECXu32wpIWyvIlpaR1CKuEN
	I4wOADj6Jr+yRhfGX8PZEdMRXRrgK9GHq8nygsMQ6/NSj7LICfhekzzi
X-Gm-Gg: AR+sD13KWioF2ZLlOFmVF8OOcVXUMlevrDSR/+vOT3/uswMveM37kIJ5OCOj0JrsP4A
	btw0Fr4sqFSrjBY6aDp61s8DKn+csEhsc9R1KKu8oAtIG+ytcm8YgtrBaEpmtMEs28S20RFrBcU
	/jBVfBEyYqOWzg1uQQwBZGaEJmKFQJ80/rQn5L+VehYD+bgN6i719eOKGvQJOih2cB26XUhEs2d
	6qFCiixMA1B2emDzzuliqxmp9K2up/rYoInGyb9c8DdXaxfoDB336x6WmSp/jAUMaan5vXs4p6C
	YRPz3XT3j7j7DJVPVPqHidPm/Vav/KCXWHY8EhQW0lKC1rU3Y7ipqyOZBHJUT2qIbV5nE6+UDui
	aRzZHg6Xp2RQQya+/RD042FyPIFg8ormAccCscRfTmbAsGUCMdFaic6DwIioOE/E23Q/PQCKWgb
	ktJlugMClU+s9iSpZlsgH+L5IPNVu505Q3G8O3dmZvm6rrAcBF0gKN2Q==
X-Received: by 2002:a17:90b:2d4c:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-3933ed3fd54mr22196582a91.20.1786909394819;
        Sun, 16 Aug 2026 12:43:14 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395320229f4sm2141310a91.15.2026.08.16.12.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:43:14 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH 0/4] drm/imagination: Add async VM_BIND with sparse
 mappings
Date: Mon, 17 Aug 2026 04:42:07 +0900
Message-Id: <20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI8SgmoC/zWM2wrCMBBEf6Xss4tJKUb9FfEhl61dIbFkayiU/
 ruJ4tucYeZsIJSZBK7dBpkKC79SBX3owE82PQg5VIZe9Sd11gbnkrFEdJwCak/DqC5WGzNAfcy
 ZRl6/ttv9x/J2T/JLU7SFs0Losk1+alXIESOLP/4DJloX2PcPDoj2jpgAAAA=
X-Change-ID: 20260817-pvr-vm-bind-1ce4f09a1774
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matt Coster <opensource@mtcoster.net>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Userspace MR: 
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43794

Add DRM_IOCTL_PVR_VM_BIND for Vulkan sparse binding.

- Patch 1 is an independent fix the rest needs first.
- Patch 2 switches the GPUVM to immediate mode.
- Patch 3 adds the VM_BIND ioctl.
- Patch 4 adds sparse mappings to it.

Routing VM_MAP and VM_UNMAP through VM_BIND is left to a follow-up.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Gyeyoung Baek (4):
      drm/imagination: Fix the vm_bo split mappings are linked to
      drm/imagination: Switch the GPUVM to immediate mode
      drm/imagination: Add async VM_BIND ioctl
      drm/imagination: Add sparse mappings to VM_BIND

 drivers/gpu/drm/imagination/pvr_device.h |   9 +
 drivers/gpu/drm/imagination/pvr_drv.c    | 102 ++++-
 drivers/gpu/drm/imagination/pvr_drv.h    |   5 +-
 drivers/gpu/drm/imagination/pvr_job.c    |   6 +
 drivers/gpu/drm/imagination/pvr_mmu.c    |  71 ++++
 drivers/gpu/drm/imagination/pvr_mmu.h    |   2 +
 drivers/gpu/drm/imagination/pvr_queue.c  |   3 +
 drivers/gpu/drm/imagination/pvr_vm.c     | 636 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.h     |  27 ++
 include/uapi/drm/pvr_drm.h               | 135 +++++++
 10 files changed, 934 insertions(+), 62 deletions(-)
---
base-commit: 09b47186a4164f3aaa3591313f80794443117342
change-id: 20260817-pvr-vm-bind-1ce4f09a1774

Best regards,
--  
Gyeyoung Baek <gye976@gmail.com>

