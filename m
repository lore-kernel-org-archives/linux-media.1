Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA657C720
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 19:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156180; cv=none; b=CiRvDnp26b1QaFfZ6avXzI6obVTh+punsqjdl3dJwQaYKJ6FOqK6AbxGkLv6V2dlvYd5gdHXRrJ36qOdkI9p21lR1onvAtKGDqUQIrui3ikdS4/Ukq5QVZ19Ukwm47mK3XOYFSy2k8MgDguAe7SgFdDk9AKdqdVDYaSaIx5pRTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156180; c=relaxed/simple;
	bh=+SJWB4l3ge5XtEN0RK3yZRvBmVaW5KcSPPi3HgVmSOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kd8JWARfANN5aEVhnFZt8CjYFXr6NXb8yyr+2yxSTPwl8Uwblxeg37BerfDNj5KYUV8bjDIZIDr8cNVb/IwOtREhDAXccvqCD/oiwp3nwnWrb1oKHQ/LCwIscn6wq1vVwXs7KW6qZdtQ9TbeCnZ+Plri1irqLm+04rOLQt85LQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFdvc42t; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFdvc42t"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so820987f8f.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156151; x=1789760951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmTShhSF6HV793ZXQHXV05vHnnfk3kV8meDt9FBDDzU=;
        b=KFdvc42t8ZUdjXItx/t+uH+0K2gtdRxbT4unl1glwTpH7VVUN5Kvg5ezfaOeeyGqwO
         GA5UD/gr4Kx+CLiW5I6awDgVMljZR6L1GbquYWEJ212hSTgTVe7dtH2azD5iet8N76Ad
         0r2vbHs2zZbCkkSJruqHsAqV2oChiuVewRpEFvvcoE3muxzJfAqCKdYaOx6UuW8OmCfW
         YdQcVblc6eGk/gOEG5xnsjm0HNHzHfN8QwFWDj0SmnpB9V2IirsvCcPfWY8VqbqVmhQ+
         MkZg53e6Czy/cuA+PMa9E2MCE5SSWtf4/AE5XCSQR2U/JzxcKfNrOmnN4X36wU27LLKg
         o2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156151; x=1789760951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmTShhSF6HV793ZXQHXV05vHnnfk3kV8meDt9FBDDzU=;
        b=XcfvzJeXjCYz+rjlqO3x11gIg42SecrBeXdDQk2J3ysSnWFj5qId19cL8tOpzjIGh/
         CHPeU0jkJBwk5XbR3vfP/bD9+IQDngD9F0c9lIqjVqb2PmNUmZUVnIpwcPLBtZwSqkck
         jpSZgwKOSltHzT5N+oSXLAsZNrI/BvQzbYJpn9pv5oH43FYMh9Rax3/ePjyPMTI65UNn
         PRMmeUyOS7JJVRMuyq49BqE/UsgYIFV0+asg55HoH5qWarZmHxZUnii7GtOSEBgjllsS
         59CpJkLnfw1yW6C9X8UsN/nXMIwopghyb7HBlIpejW6uqhzUWL3tWN66gyKpinSsNvpg
         pbxw==
X-Gm-Message-State: AFuF++miWslObg1qWGiV/n/gLR+fuZreLjErwQdnoHXRxCOSiTq4nXeX
	gP5xddVmoL7JI61Fxm35KX2iAKR+dD5s2/hOf6X0jIxSS+VR24zgvCPgs5rZtpRvxb8=
X-Gm-Gg: AYBFou1OCgN6W7gRQq5nP9r0Qqm6b0glh3Z2SZeJczI2EpLK2B2m+5eos8gA7Qj6z2a
	dW1nFMJjN/xHTpktRBmvWbnW5fsaxDQS9GkY5dlV/3RASSjABQmdqc8v70H94je0tzAehHjc1I8
	M/rN9lvyNiR9ioEZ/KTlmkxLSrsRM44aEoNsUAROMReIR3KurS8yC271TKqTouenW5BrbDqg+Mz
	ndB11is08DEuzKlbWKmdVlS82XxM8c0+hxphaV2geP656gbvMue3oAAtjb8168c/HAonvsHozT+
	edykLftBB0oNAE8Y6s2jCeobXFXqt2pw6zOLn/n9m++Hid3WImwAfV6fi71tF6bOO+tqxG9CD4U
	Al13X6jrkz66yan2Iv9zHF98wFDvEaQ2dMLTmCVbe9fmgQZb7KblUIlJq7xoxIADan5MCFctyh2
	xvYf5AYKoJ4dLEZseLpi39GgVRngxD+CU34rTfQhoxCdhK2oJ7qm9CVkv/V/ovnOZoL8bP7BLwG
	yLCaXb5Dmm0ZVMURe3eS8IQHSB6IcKxQbax4cA3vYsVeX+gOiJC7PJ65XpxFC5QPfAHm4xQIH5W
	074a37UM2wdFxGaJ4hmXRaA3rfktEksg1xBRvrWTqtQP54PEi/6lcaXyxrgMOmGqAJTktDgUeT7
	Qp8l6OJVurqWPf2yOELkaf4E+t9U6yqGfZrwhNJjNQaf7DyBR
X-Received: by 2002:a05:600c:6206:b0:49d:1d7e:4085 with SMTP id 5b1f17b1804b1-49e619ec880mr76913545e9.22.1789156151321;
        Fri, 11 Sep 2026 12:49:11 -0700 (PDT)
Received: from localhost.localdomain (host-95-246-9-241.retail.telecomitalia.it. [95.246.9.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm175983925e9.0.2026.09.11.12.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:49:10 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	antti.laakso@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v2 0/3] media: Two oopses and a hang when unbinding a streaming sensor
Date: Fri, 11 Sep 2026 21:48:51 +0200
Message-ID: <20260911194854.78894-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the second version of a series first posted on 12 August:

  https://lore.kernel.org/linux-media/20260812105305.32447-1-nicfio@gmail.com/

What changed:

  - Rebased and re-verified on v7.3-rc2. No code changes: none of the
    three files has changed in mainline since the first posting, so all
    three patches apply unchanged.
  - Cover letter: the paragraph on patch 1 named
    ipu6_isys_csi2_get_remote_desc(), which does not exist. The
    functions are ipu6_isys_csi2_enable_streams() and
    ipu6_isys_csi2_disable_streams(), as the patch itself says.
  - Patch 3 now carries a note on why the check and the marking are not
    done under q->lock, and on what the proper fix would look like.
  - Dropped bingbu.cao@intel.com and tian.shu.qiu@intel.com from Cc:
    both bounced with 550 #5.1.0 on the last message, and neither is in
    the MAINTAINERS entry for this driver any more.

There have been no review comments so far. I am resending because the
series has been sitting for a month and because patch 1 now overlaps with
the IPU7 work; there is a question about that at the end.

Unbinding a camera sensor while a capture is running is a scenario that
nothing in the IPU6 path handles: the kernel oopses twice, corrupts memory
once, and leaves the application blocked forever. None of this is caused by
the sensor drivers themselves, and all four failures are present in
mainline today.

They were found while testing two new sensor drivers on a CHUWI Hi10 X1
(Intel N100, Alder Lake-N, IPU6) on a kernel built with KASAN, UBSAN,
KMEMLEAK, PROVE_LOCKING and DETECT_HUNG_TASK. Three of them are fixed here;
the fourth, a use-after-free in the media controller, is sent separately
because it belongs to a different subsystem.

Patch 1 is a NULL pointer dereference in ipu6_isys_csi2_enable_streams()
and ipu6_isys_csi2_disable_streams(). The remote pad is dereferenced
without being checked, and unbinding the sensor mid-stream makes it NULL.
Present since May 2024.

Patch 2 is a second NULL pointer dereference, in subdev_open().
v4l2_device_unregister_subdev() clears sd->v4l2_dev before the device node
goes away, so anything opening /dev/v4l-subdevN in that window oopses. This
one was not provoked deliberately: udev's v4l_id walked into it on its own.
The window has been open since 2011.

Patch 3 is the hang. isys_async_ops has no .unbind() callback, so nothing
tells the video nodes that the sensor is gone, and a DQBUF already waiting
in vb2_core_dqbuf() never returns. The sleep is interruptible, so
DETECT_HUNG_TASK stays quiet and the process is simply stuck until it is
killed. Reproduced 10 times out of 10 on both sensors of the machine; with
the patch, all 10 return -EIO and exit.

How each one was verified, since the three differ:

  - patch 1: the oops was provoked deliberately on the unpatched kernel
    before the fix was written
  - patch 2: reproduced itself, unprompted, with udev alone; after the fix,
    150 cycles of a reproducer with four concurrent openers left no oops
    and no leaked minors
  - patch 3: rebuilt both ways, same kernel and same test. Without it,
    3 attempts out of 3 hang; with it, 10 out of 10 wake up and return
    -EIO

The full test cycle with the three fixes in place is clean: no KASAN or
UBSAN reports, no KMEMLEAK findings, and lockdep still enabled at the end
of the run. That last detail matters: lockdep disables itself on its first
complaint and silently invalidates everything measured afterwards.

All of the above was measured on the first posting. The machine no longer
has a kernel tree on it, so this one has not been rebuilt; it is the same
code, and the rebase is a no-op verified with git apply.

The reproducer is a shell script that streams with v4l2-ctl, unbinds the
sensor after two seconds, then rebinds it, in a loop. I am happy to post it
if that would be useful.

One open question, on patch 1. The IPU7 series reworks both functions it
touches: "media: ipu6: Split ipu6 csi2 stream enable/disable" is in the
ipu6 branch of the media tree and in [PATCH v4 00/45]. The rework is a
refactor and carries the bug along -- remote_pad is still dereferenced
unchecked in both functions -- so the fix is still needed there, in a
different shape. Patch 1 as posted here applies to mainline and not to that
branch; a version rebased on the branch is in the v1 thread:

https://lore.kernel.org/linux-media/20260903202820.8401-1-nicfio@gmail.com/

Which base would you prefer? I am happy to resend against either, or to
split the difference: patches 2 and 3 are unaffected and apply to both.

Nicola Fiorillo (3):
  media: ipu6: Check the remote pad before dereferencing it
  media: v4l2-subdev: Check v4l2_dev before dereferencing it in open()
  media: ipu6: Signal the video queues when a sensor is unbound

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 41 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 31 +++++++++++---
 3 files changed, 78 insertions(+), 8 deletions(-)

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.3

