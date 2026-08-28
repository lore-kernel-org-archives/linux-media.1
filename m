Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154793BD63B
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895482; cv=pass; b=V+y55Mp4lx81qYeDuKS8VO9H//CEUNhXcA3Q/QrAl4YLvmJZtK74KKFe0o/Oe3wNtOgGdOGV7J5v6akGT9sRKmJ/AU9vrVKDhovJqxCSnKluCHGwjEZD+2Fd5w82lGT4sYZ3pkDpvgFeWSP1fHlAeQWlQnSadvx+mtorX7+dohY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895482; c=relaxed/simple;
	bh=n3zBONh6aX3aNN/6KO2nIjU14xTQwCZ2/uMbihc0f4s=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=OUieb14HbGIKAtPHxsF6LV1JchQCKFVe5FrbZ3etMO+sv5EOV8sVNrQoPH5Xu0UEcOojHyBAIv2CkmiQPGe+3Rr0aqe02uQh1AAdeO3WeigCwo/+cdvXS806TSsbyDu1lwb9ogps21UjI9lIpdvl45FEX5VcKLlGGxw0394EYdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=nl06KPwE; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="nl06KPwE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d6f55a7089so5020465ad.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895479; cv=none;
        d=google.com; s=arc-20260327;
        b=f6tx0Jx43nafP9/UhMDu+E9X0EP2d7tslrDJaXVf5Q/AxK517bXQjaVfhCYZo15u+r
         IP6E5QxYmzj/0sPxqGos2oZaUhfDsbIEu9eS5pmiiQrXnA1EuoJMmjg2YATSPyxrR83b
         tWe1k27E/W5Yn0xdSerkUUEWXdBGyT5w3vpkQMXbYZNbigv/Tfw0JjjO//+cjh3ByvG+
         w5jGK3SjM47I31k9teiaGfLig0V2AYRz6BP0kaLB1lz0AV4TKGWDRsOBx3Unin/Ix1z2
         MER2qI+WF+UX4fsFUVtKAlLf7iGZjb9uSyv7MSrNgVFdkIA+v9AF5GHyvBLI90pK4sR0
         MPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=tusjuWQvUpQDeExXACcLzZWGuxo1OSmgfZQXafMf4vs=;
        fh=5nw8G4EuAJKgFfHPGLPZWnFHLEeHjz3kC6xUoMJYtUs=;
        b=h4LQ+jHU/FldNlcDiIgCZReTR2idd4uEj8hFGJpRA6s7GewhQYcxx8o4nNRsn20rYS
         MB77rr6RGoE+yNF/oTKe1tmyahCF5Affgqqy5A+rEwAUP/RHDVymE2cH6S/WbdfsllOH
         kDnVv65I/ntN7a0MBOTb7I9Lz751FIrPrYl8CHnnBrp/KNLBhTGgu3CUEkiZeBSVqaZV
         t+gm+Q7OXACDfC3Q2fSg3XBV6zqZgtS4O9THXn7ALoXN5uBI7i6Sn1wlaujZEYXOrQ2p
         wfCU40DZ+OO5+klCsYlAeR5SosyuMLipq/uRReS8A8w5qLR53XynBlJlMjfiHA1nx0HZ
         gnrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895479; x=1788500279; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tusjuWQvUpQDeExXACcLzZWGuxo1OSmgfZQXafMf4vs=;
        b=nl06KPwEGJX/m29+0+QObN1c9LaTv2uD7fUDHA+vM4lfbnPvb3S1+ME6m/0dFHfbQF
         NEO+jickQ8brNRykcgSRLzLQYD8yY59dpZl/cZMBWATQWG9VdSwHUSkceyfo/VnNyHHe
         JiOXM3NUFk4I/EDxiEdxgvX0MORAP+9tpN5zncLK7hEF3mZJ85KPK5/77SK4r6hZI7I9
         LMSXWJ4xm6uYiweqnOEtzwE0jcIQrwylYFkcXruDEhCGmm1oNZcG7FTJ7A6bcSx7btdT
         DdcfnFjQ13YabZidM5olEs4EkbTY4WFm9/eHKqfamNMxDYm8KnPwA8VhRFNylKci/sXM
         Nubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895479; x=1788500279;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tusjuWQvUpQDeExXACcLzZWGuxo1OSmgfZQXafMf4vs=;
        b=DJHuFUM0jPXe+ssW1YvB0vciq66NPxpYv73N5LqB/iDza2avho9LelMTy+bKwZjYzY
         zPmprhCZoeXDGN8kIVtliD0g3aGxD2LdOWgBUe/1RWdOvFMjsVjiDCOcQg1QoMfz+ERz
         CX4G7zzYrotVLBWuXcmSXJOcxkDshvx/U4xkiYQxVcqg25xzHLWaFfu9fCbMFbsMNCL5
         fXCAHd1QntLUIDaoTSDH1hFAHMBSB95MFbiEHlPxEpT1VTGKOVCfGFDaSDROB8wU/O8q
         LWZXIUPzF7fPoO1VHyL82HO5+Drt9EoV5GwtC1tfAJ3Ef/4Tk7ZNYMM38wX9BpmiRWil
         4ayg==
X-Forwarded-Encrypted: i=1; AHgh+RroXTudZgwEOq+/cvVKoK1HKSBpFZVx0vg3I6yonOVErC5fF9stpgRtRDgoN3DqBBzmKaChyWDZ6ZCemQ==@vger.kernel.org
X-Gm-Message-State: AFuF++le5YxO5atk5SS1MVG81zFh5D/mElG9fu3bFQBODf3h1FrPQ6tK
	6CEBhijkpuTkVX+Jhm+W5I0EK7Dz5rwMUNgRoXebp2ffxEdXiLmPp/04jCsb6bxjtxPCqSvG8yY
	nUqnKirp8d+2zcGUEtwnv5/F7VR50/vQ8RkCa7Lo9
X-Gm-Gg: AR+sD112AW8H+Jz3E4ac+FiQOgjx3rYqv+D9KtjAc1t0e5Mipx+atmfdkOokz44srt6
	x0fkwpCSjNtyC6P5S8SS4EkBgjmUdbD2fb6U1esSRXBcaXyvWGqUuoR8lel3GmU8dOGTc+kerMS
	6c7/88a26o3UQaEc81eWHRYnis7hXZPnT6zA6k5+eckL/A/C9+ZrD+dEdNlgeqv4h7b8r54Fgox
	PdIRk5OI/z+Tz+yPd2XJi0XaQde3Q44AtqSZQjPUe8/AGYDuRhYQAIGY8d8UiQaJV6PfWuiH6uI
	1g4X6WouuhoGBO0nFme4sho+d1KxtOwVBbWv5FVh7o28l0dklzZOHyyrGVeUgC35gLoQo6OrW+y
	46nmDmsLkcRpwLu0GgqcXloQ2/+sOhqLH
X-Received: by 2002:a17:90b:3d88:b0:38e:5964:97a8 with SMTP id
 98e67ed59e1d1-396d0f52b40mr9523946a91.16.1787895478534; Thu, 27 Aug 2026
 22:37:58 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:57 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:57 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:37:57 -0700
X-Gm-Features: AcwNN1XzTmBYqrqtZ_dmpRR7CSc9J6NPx7Lt1tzojZpsGhuCIv_6xFEHXYoQIos
Message-ID: <CA+0ovCh-g9VVVHojVu+JoArJZvuqoiOe9rpTkv2iMNTcacMetw@mail.gmail.com>
Subject: [BUG] media: s2255: refcount_t addition on 0 in s2255_probe_v4l()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/157-media-s2255-refcount-inc-on-zero/

  refcount_t: addition on 0; use-after-free.
  WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x9f/0x110,
CPU#1: kworker/1:0/24
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   refcount_warn_saturate+0x9f/0x110
   s2255_probe_v4l+0x73a/0x9e0
   s2255_probe+0xbdd/0x10a0
   usb_probe_interface+0x659/0xc70
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450
   device_add+0x7ec/0xb90
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
