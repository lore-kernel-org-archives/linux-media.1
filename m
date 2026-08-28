Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B90353A8B
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930764; cv=none; b=gLUhsEcwU1oEiRNXjXTjupic3znOmbncZNFOjpHmRB2myZ8xdWS/LtAS+wvI9MAl7iaLiXE5oI3x9S091atKp5ilXgqo8EDgTnylS9ZB8zDIwoidhrE3XU4Ni8q5BLxaFzmfJl3bZvzpu+Szu1vhI9ibU9L90HPG8ODJGZo6d4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930764; c=relaxed/simple;
	bh=1j5HoO6Rw6w7CAFZbqcTNA+EG1BhAQMUNIONwCzMFm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQxE5BlHVPQWJpQJMDMIDrrF9vk0Y77VOFulJyQYNavyWAYy8gFLzjSwjlp0+TGqvUgXInVcN4dXJOb9aDnkqSsmzs6OHrnsEo7qmmV5Bm8qXlSm+a1l5QBVfPV7Yz2w4xHO7x9rVeYGRFFaIswiEIGd7lxyCmwxYNFhZ9hgMN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lrxer6Wm; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lrxer6Wm"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-836cb2fa1bcso10411087b3.1
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930761; x=1788535561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oIM+ChIl0h+IYty+JJJ/R34I0BvTfYNv7RhSnKuWxkU=;
        b=Lrxer6WmoxXdYAAWjcYgKbTYMH/bF5fD1QALrcqh1qJT5mVisZ3I1vAJepcEA4sL3P
         KXhlK9xKwoFGE5KC7+uWf9goqdlwXquPVv+HNeBPYmrSTiG6Gw+j34PNhzjlQMmzc/uV
         cTTDmiVsMsYkL0eQ9NNfkVK1aEsYwGwylpDqZlLo6FLW4hcWfR0cWdRd+MKNd2J1CzRX
         ZQ4K5KWgb/EEA0md4emDYTsxB8CjSDWNtfeFTe4xeP4nTUMLzRE2JQYGnEyDwpqFb3kz
         P7pQ7XuqbdQU3Ri7vRqNKh7CoY4rn/TBdfy/PVsC2WuVFCiaT9kjHg9OUGZu8+nP7Xct
         eayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930761; x=1788535561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIM+ChIl0h+IYty+JJJ/R34I0BvTfYNv7RhSnKuWxkU=;
        b=eq4LdWT4VQyQdGlz1Y+q0xNkkqDy43gdXNEVQPp0Wq9ftmJ80WUf3z8RzgcD7iBf0B
         gu72qQm+guqwlf/Ix/mLbpiF8ZhV7OOgqtnY3SIpVFx9PMbhnXlknA71LKR7ub9M3KfA
         hHMszS/hEuhPsVRM7dc4xEcC38etsLfWWuECGb+fQSZ7G4Tc2+4CPvbBowA3HpS/bnrU
         ZU6qVHohWnIbJ3uFV9VOIcUFmZ2ZCo2wd0o5Eu0JT0jRaHzOLqAVqi5ZSghgoPZk1L5L
         xv+SK13H0XwdsQgH9bRxB3o4dmJoOHtNBESxk4lHYVvWvY6117XG+yNm4yfIrAxtTf3a
         hMjA==
X-Forwarded-Encrypted: i=1; AKwUvBzBNw7QT7OHy9hkkY2/Vr9gKFtQHpq3Y1ghIBvB5Yy9rn9IDln7uw1kTFoeLc3j7zOoXFZ60iwqIazIeA==@vger.kernel.org
X-Gm-Message-State: AFuF++kBdTNAeFYGkTexIjKvJSoQ/yzPA93bLqHkbNQkixNRW3dgh7CG
	VjC3FZj0BlcEqndCyYhoU7b7KTXLxvPhq7Mwdzl2txwK4aMWJRS+L/Cn
X-Gm-Gg: AYBFou2SkLeU62jRlCyuGE7ZUGj+To+zCI1CLRoGrV0VXcetWUsODV/0PMNRys1uVSJ
	9Pm2inzE7lv8ees/JlyaRFGbDbBNpnK4lgU9rgWS7yQyQCYfNmD5qv26nCo2mKfoj4XKGIOreFF
	jeWg4hqHMpz3+p6/LXAtjoURTIc+fKntW64RTcqjNlGpC5zQpU+/swdjRmCA8VK1vqgDUE9p8Gf
	dmtdyROjxelgzR9Nyyorf/4KPWVWGeioPicl71DNaE66p6h4HrAHCSHcFG9u1uHD5zYocW36RAV
	gn3WjF92Ikq8Pvy87wUSivUWD8ykZ8rHDL7UzKwSe3qoKIfg6O4/Lsdvi6af3kL2SkN7o4PxSRn
	mRrG3V3FCvLM+ckz9GEjbsK9GdrHGechoiJFiarg7evPresH+PXzspJGbgTAUa2GZwBqqLcP/El
	LqgT0aJQnHAnQmEnsIiBEUbBgLfARmsicOFG106dUY7qP1mXjUT9TBi/MjF/5eUz14ny+fBHrsf
	jnM4WHZ9fJ/iOSYVnTuxbhqbGG7NUH9ZXfixCXT7Iw=
X-Received: by 2002:a05:690c:e143:10b0:857:b0bc:af77 with SMTP id 00721157ae682-85d6964253amr26650697b3.7.1787930761220;
        Fri, 28 Aug 2026 08:26:01 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e6756e0f3sm8064327b3.43.2026.08.28.08.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:25:59 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH 0/3] media: uvcvideo: live pan/tilt position on the OBSBOT Tiny 2
Date: Fri, 28 Aug 2026 11:25:54 -0400
Message-ID: <20260828152557.653475-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replaces "[PATCH] media: uvcvideo: query pan/tilt position from the
device on every read" [1], following the review there. The approach in
that patch (a driver-side VOLATILE flag with a separate live buffer) is
dropped: as Ricardo pointed out, a control that carries AUTO_UPDATE
already gets re-read from the device on every VIDIOC_G_EXT_CTRLS, so the
problem on this camera reduces to its firmware clearing the AUTOUPDATE
bit in GET_INFO, and the fix reduces to a flags fixup for the device.

Patch 1 reports V4L2_CTRL_FLAG_VOLATILE (with EXECUTE_ON_WRITE for
writable controls) for AUTO_UPDATE controls, which the driver never did.

Patch 2 renames uvc_ctrl_fixup_xu_info() to uvc_ctrl_fixup_flags() and
calls it from uvc_ctrl_get_flags(), so the per-device flags table can
correct standard controls as well as XU ones. No functional change for
the devices already listed.

Patch 3 adds the OBSBOT Tiny 2 entry, restoring AUTO_UPDATE on its
CT_PANTILT_ABSOLUTE control.

Tested on an OBSBOT Tiny 2 (3564:fef8): pan_absolute and tilt_absolute
now report volatile/execute-on-write, and polling VIDIOC_G_CTRL during
a commanded 60 degree pan returns 0, 21600, 46800, 90000, 115200,
158400, 183600, 216000 -- the live position -- where a stock module
returns the commanded value from the first read. Reads also follow the
gimbal when it is moved by hand. The vendor was asked to fix the
firmware on 2026-08-04 (ticket #8220); no fix so far.

[1] https://lore.kernel.org/linux-media/20260725212332.64927-1-jordan.mymail@gmail.com/

Michael Jordan (3):
  media: uvcvideo: report AUTO_UPDATE controls as volatile
  media: uvcvideo: generalise the XU flags fixup to all controls
  media: uvcvideo: fix up missing AUTO_UPDATE on OBSBOT Tiny 2 pan/tilt

 drivers/media/usb/uvc/uvc_ctrl.c | 107 +++++++++++++++++++------------
 1 file changed, 66 insertions(+), 41 deletions(-)

-- 
2.43.0

