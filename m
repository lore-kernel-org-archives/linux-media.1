Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F1137C924
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887060; cv=pass; b=c510fn0C3LzwTAOYTBHmoVFJDoB1vYzGf3trS6144c+8cIQOBNuRyLvtKPJS9UqLfzAAunIPoBeGlX96mmNlp7HFL++rz4WcCt0zJivVhyMx8K7+iWgMjGelfAec0699ffDjCkXpqoAaHI4Pu0HTQEfavvkoWq5yjfQFkP1Bhk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887060; c=relaxed/simple;
	bh=S6BJDPm9RZGBFT8WPPhx+61JG7HYMFtmnnPKJ0tFTh0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=nvmisdoOUYPTjInMufbrSsn+mUvh4xVth/2tZuEJs9PQnzWRWkATWyAZYqQkYCAFdRYuhwfaemxPRcH7WvbPCwgArxbBvoJ44FGyY/el7z42gdB0yKkLN/LLwmqtZG303FGwgBq3fUEGF8zVryauNKCJCBHewIeoZR+Zj8tENbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=cQK4O4zh; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="cQK4O4zh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceab75934dso4338725ad.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 20:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887049; cv=none;
        d=google.com; s=arc-20260327;
        b=BPvnkZ7vPnJv0itMiFBeSBVbfvyJjqdAfq+CzIYtFrArfcJTZMcMbMvgBWdxQOBcZu
         P9zIQkbcXvNDIA5b4ZqPE9Tn3r5A99GxKDaEYET5qZMiq8yPFOGYyDYSPUoUmFTf2av5
         lNgEHX64DsxpB2X8jKYY4GlBmBucQBri9k+yD448hat9KAh8qTCji2AxIInLgiEp2V4l
         x1ZG0u/DTZw7G30kk2GKIIsDzdsZrxuz2J0K0H6sAwzYmy/zHEuwmVx/xrecnGy2QAkW
         556xPf33ve/e0QxkzxM+DpEeiMI9UQgd5yj/KFMjvv0ys2ZuPpM7vFnjujNmqX/Se46w
         atTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=tEC6VFBLKBdB4JV6CKJb9tbv6iJb1aKmtvza2AxjDL0=;
        fh=wLYh9eVoYnfahnPljd4cl/eaeq3W+3+tXKo/irY653o=;
        b=Og59+gjxBjh6i8vBP4S0oWIWEHfw7jGKNQ/Ctzbg22y+9Elro17jZaWam7JGo4bdkw
         OqTdpNu8rZE0XAMDdrlm+aOV7P/wF4DlM14BPgbquxlfoxn/kFOhHrTfeoEg91kIrC+Z
         CS0GDgk6ipOM6C4P7/ARrb8vtQFx7Vfp29ZORdJ3d0zMy2LYxcmFS197EczRIm//p7FS
         xhgTrhWSPIGEMQo3xl0owGsqoG0kWYFui9qZGk8wtuZXf1LmVbaUPw3xw/6oLgy8Al5Z
         LeS3jtcpAuqVeAYHNvE53rDdF48RkSw/ZLOtikylk8YZCtbCCl3Az8exJ4bDVi5rR9nj
         /oyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887049; x=1788491849; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEC6VFBLKBdB4JV6CKJb9tbv6iJb1aKmtvza2AxjDL0=;
        b=cQK4O4zhClDt/ojD+tu9FVF7tPPpd9YiV7bpLH2/BuwPF6A+YMEDiLEDne2qgHKolD
         G8wEVoef0qAe20pqROIzf7lNWxpBwYDHm2sfJjPnZIfmNYafj7d+jwRxx3N0ycW6nFrU
         B8NCbrORvkb4Q+3vmq1Jp1Q9k/WYBPAy4B4c//i+wE4/gf4PU5S2HCTaBMgi0uDP2O/o
         aOAca0hwlhIrTvieq1kjbZ7e++qAceKOx5h6qquRsQNWjXZzKGxHnSZ1r8V/d9TAsihZ
         noFvw3WKTPnSfCLKbmnS3tOfFfx9oXH6HxBWSeFY050DyXdxj4O4au/EI5yvQbDkYSaI
         y8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887049; x=1788491849;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tEC6VFBLKBdB4JV6CKJb9tbv6iJb1aKmtvza2AxjDL0=;
        b=bliuZUMQFTcvtybXsOG+h7uxgaUmpouExLBJSTKic2XrK0hBf4Gg4lt53fwkPbZY9y
         Oc3JwtkaNX2z2lJrptF3TDNYNBnSLuvGHCVCuDzzOfDSq9m8RGzIlMJ7qZDks/Gf74Se
         O2sjn4pLndBDlwATPLu3fTwnlDhb6/Q/4FnU9mUkNGdT7Tz/wNuMlCM83/Zf+04Nfazo
         7oZ5rzDgELFprHJ15OLXPyELjppaeXOuGFHk3RZLUWsL/i1YdXV1moTiyC/D9bsAPi5J
         niJy1+bttE4Wl+DcmkA4UtQ/knPd+iu9GXwpNGYBZqQXcNV6zvokwK2CRKArCN2DX3J7
         UCVg==
X-Forwarded-Encrypted: i=1; AHgh+RqzxB6aFDaGT5vMZnOR7ckKKgTxZ/5PNvP8qLn2ga3ZqDbfFzncBzclYNVHjNxCtWj50jLTqo0fQPTsxg==@vger.kernel.org
X-Gm-Message-State: AFuF++nyZWLPoH4s0t30+VStoO2H/CW64IhVPEFBu7VbY4E52EX/hgw0
	i+FTpTBHTu7v7csWVc7FcX+dh0LEWmI43p+itz2j3rcdxLX0VTm4zesnZFd3yh/IwjPTjMWWYPl
	rUyS5Zlzl8jsj6ISTHovFrkEoKfTx1LAoeKCo4+bZKP59RFDyoL8ufQ==
X-Gm-Gg: AR+sD11GHZBqU0GJ7WSL0nQa7KtdizQ4vF3GqHzzDPCSdnm9KY5Y3BpDOYSh3LjWiT2
	5TBLh6ZgQezy3NTFRes6EUlm04vSNAWrpN9NICdAuPU9eCnoyKVcTcO32UdigHBdR+dMMG+6V1w
	dTBgNpnvKzpytq8fCkbX484rJ9YP0jnrketY+4j87gX3Gkt6o1vHnWAV8MC35eSB3JXLzMbFOtQ
	OZWIEWPw2VSjZsAj0qaM9FCr+Y44XUp8x+bQaQqmn0fQCpDo7p51ebFzA+Hgfana3/Rfx5jLJsr
	KMgLhJOFehHdXuYHjZ0pqt5eA297DfPNdQCIk7zpgzky2uh+rWoFID/EM5RMwklOxiZ502DT3GR
	yUM6dVeWdZMD0CpIofweFl8G2AoKvtBsk
X-Received: by 2002:a17:903:286:b0:2c8:248a:5dbb with SMTP id
 d9443c01a7336-2d74dcbe867mr76376515ad.7.1787887047796; Thu, 27 Aug 2026
 20:17:27 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:17:27 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:17:27 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 03:17:27 +0000
X-Gm-Features: AcwNN1WzhnOCli2SDXHrwUn5J_lFqhLJhoFoqpoitatUkM71A_90zZS9tLQkUuw
Message-ID: <CA+0ovCgZDiT-7gRM+VtvwRpjycqDMkB3J6Qp401NyqvVbjMaSw@mail.gmail.com>
Subject: [BUG] WARN mc-request.c:528 -- vicodec request objects are never completed
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/126-media-vicodec-request-never-completed/

  req->num_incomplete_objects
  WARNING: drivers/media/mc/mc-request.c:528 at
media_request_manual_complete+0x173/0x230
drivers/media/mc/mc-request.c:528, CPU#1: syz.9.775/21126
  RIP: 0010:media_request_manual_complete+0x173/0x230
drivers/media/mc/mc-request.c:528
  Call Trace:
   vicodec_return_bufs+0x246/0x300
drivers/media/test-drivers/vicodec/vicodec-core.c:1527
   vicodec_stop_streaming+0x48/0x750
drivers/media/test-drivers/vicodec/vicodec-core.c:1646
   __vb2_queue_cancel+0xba/0xdb0
drivers/media/common/videobuf2/videobuf2-core.c:2199
   vb2_core_queue_release+0x2f/0x150
drivers/media/common/videobuf2/videobuf2-core.c:2677
   v4l2_m2m_ctx_release+0x2a/0x40 drivers/media/v4l2-core/v4l2-mem2mem.c:1286
   vicodec_release+0x94/0x110
drivers/media/test-drivers/vicodec/vicodec-core.c:1947
   v4l2_release+0x1ad/0x370 drivers/media/v4l2-core/v4l2-dev.c:468
   __fput+0x435/0xa40 fs/file_table.c:510

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
