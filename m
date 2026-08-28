Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7016397931
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 03:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887018; cv=pass; b=CEFCc2DZP9ORyeYgQ2ADIE9SeqryFDxRQSQBPzzVfTnqDi3Im0gxNGWEyVUBJcBBx3bllKpLp6M9ZGTZJE/bFJwdHrdpG1wcKkk0MBdzvwqVLTAfv4ZGHfGawTbzM9HJGZxnixfDLgR9a6HTMmuqnPgAGbh1dZq/frGa607uO0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887018; c=relaxed/simple;
	bh=cy+Dc3TdusmXUApTnyHfbFYWmBv7uzImSgye5KKeyFE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=oZ6AX0kRh7w/eO4t5nY5kd7Slz+NjRhauOFbzCUl69cKGkOUoSC12H3BBujTX1FnsS8w3MPs1KK4eLmEI/CtL+OBwd10pMpAqxG4sruBSoS9jL/qnDURKb492bQqaGuIBhjpwsHne6M0EooGIhRkookpb3o4p802cQMPu8FfZls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=oyJ2h18H; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="oyJ2h18H"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d53197d8b5so4638155ad.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 20:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887009; cv=none;
        d=google.com; s=arc-20260327;
        b=RqISyeb/B6e3iq1zXZTHrZY7+05DhcSEMGBPLVcgoaxr/XztJYVPgq9Ig5lUHsH+D/
         UtsoKu+bVlduRA6vDDu0DuLKnd+/ma5BgOpPaK41Ui7fefsFDTQjd3nUF4yst/Lz4d3z
         C/61kwHIA60Ys2BUJPly3F3zn9W8RSgUMjUEDIcjOhIeJ3J9VCOYyvGXaAiMiw5adwdW
         fKoR0K7U/TfYCkZVXno+1RUkHrTaeb78AGmgsbpkcJE06zqrI8N7b+1NsKnT2QAPGshy
         TrhmBdBvCq9zXK6orw32ZNGRFrFOk8NeF1j21ILPDO43Kwzs9wgms7WHH9YS2fRhMc4M
         UNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=0HZJPWMt2ET4Ks/zZSuRVpb09aUYk4YcREWk5ukGH1k=;
        fh=EBgbymCR8mMRbzu71Q6ico+EcBife/OAriLswnABeQg=;
        b=o3EMod0r43Le+mApBtH0+7QV2SoKdf7RUX1WQaA4fzjhJKI7wdjRqHqyqv6iBxNCy2
         UlOwu/rcwgRtWj1/j0fUtv8a1z6XzGw6SOuXhFYDFBh+VoygFzGqCL8n9CD9darfKHjw
         dQEVgNic+bT0X90l7I8Pl5AEdXism/8vfF+tGXsgNe1cQKi6brFoc2QlDo20XaXTzhIc
         JKt4Kp+zjybv6aYQgTiDFmrKLb5twA87iDaaU44ZlC7qdmBVulfycK2yT2uRBEOwnCfQ
         haBndqcsPZb9m4U4WalWUTiGIgNKzjusXyAyuWEIj6wYw118a6AFYc40dwxFmQwYnqaN
         wSaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887009; x=1788491809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HZJPWMt2ET4Ks/zZSuRVpb09aUYk4YcREWk5ukGH1k=;
        b=oyJ2h18HcCskpzn89BU9ksJGAKzy9QsrzLdbf9irkqoHE9yCueXL7B61MthS+cMCb0
         gmd5bMu57XvNviiMHbs3i4As/KyLoFKAk8XfTWyPtqS/DYOADfyZ0DIS2sAVz9kZgrUs
         JnGHiWKT9YNlewbV/ivmNymmnUV2DbzoUT6/FMrGn6CUVMqA2dbEYlwcyMEwJWag1KPi
         n5e1Eh0xcGLKv8BN+PoOj1vHL8aOiurO3qHroDpuezyZ8q7vTbIu4D0At8C+0qqzL9tO
         OHFA2t3IP8+hFkKHMjE72S9NLDrJCrlwE+N/UYULaW0WGMXX+xsboRjFlc+qpqt1CawA
         eFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887009; x=1788491809;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0HZJPWMt2ET4Ks/zZSuRVpb09aUYk4YcREWk5ukGH1k=;
        b=c9X759DMzjoIxnkP39JO9Lkoir7tuS8ksxNoSQd9MxMiAKjumDJCo+Rhqv7XxDZAEA
         6mY8MUUX5/DK7LE1Ah8dZ6ogVn2MRbf88Bgl7ylmgXqyK3HPi7GMNQNp6fN1Gx7oTjNJ
         2a0MBh897pwLYNk+8544pPI/0LdZl105ImhD/fJFQfCxV++t3RbiujwWdKfP9+EBfVk6
         8P6B4IoOXQV2trw4hj4TvQYICV2aUZYU5UNy1DafqOri3UtgkrbYV2IMnN26rSVmdvRe
         /4msVlYG19IM5b2L+czXkD5X4RygB2zyx7G4uHeGeIJ/o+MM34/0tVZh0Vn74yzLsF5d
         ZYrA==
X-Forwarded-Encrypted: i=1; AHgh+RqKDlpcUQWvPoLel56Jx7FNdPX22GFDETNbReKOG3Za6WGQKZjqiDBz9YwVTnHUFHfo7dcMeEPSTelWlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l/wZaQuhENx4hLklgFE7jLIQwnBdyeOpvG2OGQUZ58oPYrG/IB
	D0WHFoBPU75HtbIWTMOpAkqbC0lKeX63M7W6v569iOv8m9EYHNlIDwDEUijqyLK+SnQGv3LKv6v
	k+GZUCVPMngOO8kEJv1tYpCIi7nGH2rEM8IJ8JGVk
X-Gm-Gg: AR+sD10qtNfE6tQGZdI+35vnhHoJns2gT6/38oZPlnWDLww8Jq3d50DZHvA07oyb48U
	fBxYJnyLMdwKZBs5SkpxI6O+agGj3PYiLBprxx0DiKRgBDA1Mfbxe9VwOg0fre5HCPl4yFRQAX9
	jm/aZihKhry87K5GQUmh2puivSI7wqQQYbrkiuhZARy6mqBl2+hzQpCby9+EFQxPggIASzyDHWt
	SsNm8v5gYOEPSkwjRVf7cy7zGfAPlTUDlZMdJ1TjlwQaldNcNPlkQgYtgO2ang0ua3ebnDSSiqj
	qSGjefdbF8NP5hPn/4U+peO/eW4gtNYtiafRIvQLTBtenltHNNkdWA8oTALMfmyK8JkG80EMyr1
	b0FExy/Lx+z5WtekGlMBXY+YR1QIG0gd7
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id
 d9443c01a7336-2d74dc6e805mr77361815ad.2.1787887006148; Thu, 27 Aug 2026
 20:16:46 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:16:45 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:16:45 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 20:16:45 -0700
X-Gm-Features: AcwNN1WhyvIa-awlbIrN68vkpEktGaXMV3QKxAguOkDfWttHLfYmvC8B_tinu5Q
Message-ID: <CA+0ovCg8FUMDO7RUA6Da+RatLG6eQQm9w7ifnYdCasYGHtjYFw@mail.gmail.com>
Subject: [BUG] WARN in v4l_querycap -- em28xx VBI/video device_caps mismatch (v4l2-ioctl.c:1117)
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/125-media-em28xx-device_caps-mismatch-v4l_querycap/

  (cap->capabilities & (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=
(vfd->device_caps | V4L2_CAP_DEVICE_CAPS)
  WARNING: drivers/media/v4l2-core/v4l2-ioctl.c:1119 at
v4l_querycap+0x359/0x4a0 drivers/media/v4l2-core/v4l2-ioctl.c:1117,
CPU#1: v4l_id/26859
  Call Trace:
   __video_do_ioctl+0xad7/0xc90 drivers/media/v4l2-core/v4l2-ioctl.c:3133
   video_usercopy+0x86a/0x1320 drivers/media/v4l2-core/v4l2-ioctl.c:3475
   v4l2_ioctl+0x18d/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:366
   __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583

  BUG: KASAN: slab-use-after-free in v4l_querycap+0x415/0x4a0
drivers/media/v4l2-core/v4l2-ioctl.c:1112

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
