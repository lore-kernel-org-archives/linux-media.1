Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628904;
	b=yoQe4bBIUTu4kKtQk+BsePl3AKY12YZ/PS2tCpJanNLI2xtq1B6/5E94Ql2e4CTqGcRH
	 W3o3e2SQa36BFTtu+8RVKC4Xnlj21dOflQXilQvDd2z0BNnCKHpCjIgITFdWxunvvj813
	 s7OMMi1/nGYQ4EVFvM/bwY07lhT+9V4MnK+nXuRL3sX1trP9KbanZiI9zSh+FTPpDPean
	 Z4CuopZtDtbBw/jtLcubVKukNr13ppz+kPDQNJK1tPw14mzvePtPNFMWhKVJ7IG9N2tay
	 c8Col1dc+Dphy+OjS+JR/p24SE3YysLVQaYXjJBbDj5eGOyyJksen7X7ydb556mw0kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fFdoADdkdxRr75FQJBJurymI/Hlb9VRlM6nlg9L/Oyk=;
	b=mPdIKcT0GejEjY8SfltyPYHGvaP/UrAgEoO5IQtUYXywh+ukc4t7I90nXBtr6/K4/CjO
	 M3c8t0Qqp4B00UzqWtyIGZWNR1Dh7aSig9ieXMf6KwbSg2U4HVGLYoTkwYVtEz7V9mdO7
	 mrEDjqlez8cmItQo6DKgQjseWuL64o/7Q5IZffD/jweimZveK3pyXaTzZmJCBbuj9RCWS
	 QvgzyIIOB+8B0+Wb/Jv4S2zUM4rBsFc7NcXFi0LLDfynWHV7mIq+aD2coBeIQGcsGFfpd
	 zjRoPf9OGr77z3HwY5i8fNjqE2W1wCW/mMBS5dFQyRsjSe70hpnBBfe2qc0hP8ff5LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffq66S3b;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63451606B5DF
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63451606B5DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffq66S3b
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so4738183eec.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628903; x=1794233703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFdoADdkdxRr75FQJBJurymI/Hlb9VRlM6nlg9L/Oyk=;
        b=ffq66S3bMi4CNLYwXNHWjxzDPa40s2nFxTfX+qSjFTubPxW4qTDL6YzMdIA5HuzMtW
         I3JUDikrgEXXkk/lZAZ5Blq3jxrfcnUUB0ZNdRo5h6sJ51TGk7zbfHxXcubeOTo1FfIs
         ID1LN0ajhOYBWqjMXtsyuTPPrp9VX0tToxioFGDMiKg5zj6gwzc83lEUEY4YOiyljkLx
         4doI26Go6XwPjRHXB/hrSQOzoV7abkHcJDiMUIt/w+l0+uI+/DEcj9wKDnQCCUZ3thtr
         LsuYhbPY9+jdedMTwns+ezO3dyKVLu7vCYLGLKSFi/hCSqgFEgQU5loFe5uPIg+2L6Q5
         IbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628903; x=1794233703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFdoADdkdxRr75FQJBJurymI/Hlb9VRlM6nlg9L/Oyk=;
        b=hfpx7aaW/eXZCPaTWCwhfZbASqu//i11G4x7qL4cwUGfQRFUthQiFE8iTqKvGwfTqM
         AYDKmvVTIgaJM1BXu0JCzOiwzoX23WO+/B/N4xkkbbT8X8ux+jHBi69XmxGDs+0G1b8Y
         hAkDpDLEfXPGuE8DsVMAr8QLb5jpVu/Iw1pcGzMuJ3xU9dkDXC49GTzj4HgSj7Aucvmb
         lbBgZh9Wy7vY9/0u/yNIZfiRy/+PHGCeibmLb4GngVi+Jj2I3PokzAy/d1aYOnAeOmxv
         swn//ZTZNjtXT+ZComPDyPCm0FwvrwYMfB2saLHJYvSDn6ybmywBMCyUWc8d/MHiEnfn
         9Vbw==
X-Gm-Message-State: APuU4Z+LnzsZitftnRHG4w68x0/+xw4l8JZbNR77PQuIiz2PA/UKHST8
	qufuHtP8XDfuL0jrgjFdk77NKJ7W6ZXLSfGC1kic88dwIMViQepd3SyU
X-Gm-Gg: AYBFou0uM8UPMZPFVTz/FFNyWe77aF5dPOSgHJxUVvyWNyIyv4/UMIGTjEqrj01rueL
	J/MW+c7529xqscBBzQn7ap8Vi1EXKDX4I+5Of+L9EwpQ47SOhYCtRl+cT/8OQJ932eL3VhtDyaG
	OYlgjraWoqKp4vdii/F6Qpvhr3aoI5VeOgk+zQttjSC0RZsDYsCbTSYSrEDjvXz9EuXVaoh4l0c
	faBOkjs0NLjFeVGuUkrM9zswjy2+3/W5npYZrZ+2bMXfPxB439ohx55wTK6WPVBJVIGTyLUmPop
	+9DobE4tKjLglRjEOTuw4BJNls/5NxEnTU2addJnbIRja4/DcxRLqSivgllsOgLVaQw6zwbdMDX
	F33ozbsyD7KIslRZ+Oi0lCimZ7AaUHva6onfvMQ0tuZB/ADPFzMiwgIYiCV2xtJD5CPusrt9grK
	BDCDQK4Xmn5pB+Z6urFToxQsxrOMV67H/E1UdyvKwlzShdxOkImeT7OcA00PTs8onEa0doIf9Ro
	u7oY5qnUhOOBz7tpZXwJwpeht/jJ/ABuHDMuiPyVvLlszqtdP79dZ5c9qzwmq2aHw2nn659ejyw
	+y0zJqo1b1mxzTtw0pw2dPTu+A4lYAJFyNdXZYBTAF8z+rT6TEDSmXrZHrCVrOFkXy0EC5ORq/Y
	w3p1MCwNV/8ow+ChMNdcv+mZza0n1Vc23lRrP2eLqk6JR1AAkqqXagq89q+bP/dXDVtAAAdUlFY
	Lg
X-Received: by 2002:a05:7300:fb88:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-36a437a4eeemr22442050eec.24.1793628903178;
        Mon, 02 Nov 2026 06:15:03 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:9626:1a7c:c4cf:3e3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm33556442eec.10.2026.11.02.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:15:02 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Subject: [PATCH 1/2] media: em28xx: clear dev->v4l2 on v4l2 init failure
Date: Mon,  2 Nov 2026 19:44:38 +0530
Message-ID: <20261102141439.13505-2-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141439.13505-1-kartikey406@gmail.com>
References: <20261102141439.13505-1-kartikey406@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If em28xx_v4l2_init() fails after registering the video devices (for
example in v4l2_mc_create_media_graph()), the unregister_dev error path
drops the initial v4l2_device reference but leaves dev->v4l2 set.

If userspace still holds an open file handle to a video node, the
structure stays alive. On USB disconnect, em28xx_v4l2_fini() sees the
non-NULL dev->v4l2 and drops the initial reference a second time. The
refcount underflows, em28xx_free_v4l2() frees struct em28xx_v4l2, and
the later close() makes v4l2_device_release() touch a media entity in
freed memory:

  BUG: KASAN: slab-use-after-free in dev_dbg_obj+0x630/0x830
  Read of size 4 at addr ffff888023601bd0 by task v4l_id/6384

Clear dev->v4l2 in the error path after dropping the initial reference,
so that em28xx_v4l2_fini() returns early and does not put it again.

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Reported-by: syzbot+54648a6c1187a7ef46a6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..ec4ed2b0e5fd 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3137,6 +3137,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	 * v4l2_device refcount to zero.
 	 */
 	v4l2_device_put(&v4l2->v4l2_dev);
+	dev->v4l2 = NULL;
 	return ret;
 }
 
-- 
2.43.0

