Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338525A33F
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806484; cv=none; b=t4jNCuJgSp/+SKQNkAccWmXq+Slm5mkvcqus8UwgmsxBIntwCy4iTnBtUNWgL/Uwly5n/u+pMgG7P4XJ16YMuwUTl/E5PDxV12+tVXRH0gP1kGvX3ROJ6kPw7or6sJZbaAwEqvXGJQ4EN6lVJ5zqVWeEwHbuqiih8r7Sf5zbk5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806484; c=relaxed/simple;
	bh=bA5jsLeRjSO3pvqvsJ8DbBQ0juWtpfLNWdNJGf18D2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=COjFMajelwvI+Jt57ZgXZiMZw3Jr9Nf7Vew2JiVqUzgjVXV+d0zYEY/wWAoTgS2shAdzq6A/QOE+ixi4ja+tsYvi6kSMWFrcuyF1Bd1guJKwDa90J9TwdEi3JxfpBoT0qlt1UNv95gutDSwudidPu9W5bDanh+zDz5RsK3vJpco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKfZm/55; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKfZm/55"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4631679f204so172964f8f.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782806481; x=1783411281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YI/jgLaFSFJaOYv0jGHZTjandLkO9uhSh+X6he+epaA=;
        b=gKfZm/558gDCbn5yt1b1X6EeDT2HM2DYmPxF5IA84kyr2jRvurkXTWZEI7+I1If+LP
         ufYBxj2RGAbw7USP4b5CwcIOTdu6zwTLxlstGAIPnbmt+iP/ckC51LKPOrGOtgnPWh9O
         04XQInBACM4bCXXZ1WuUurE97E5ES2EeDDWCfo2saJ1S4WtlHpxBwneOuu8/TbC2kSBQ
         et5b8U0MvzKnkHiolIFT2aX98TbETMGUJk/FWCpGhc0MiU9a1TJUt+OwTQa6nDNXYcac
         +ECvDRPKE6sv5d6Wz6KtfylNjl8mb0mi/7MosEE6Nx7fhVffLiT20ozHRiEZ+p7/yVJL
         oiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782806481; x=1783411281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI/jgLaFSFJaOYv0jGHZTjandLkO9uhSh+X6he+epaA=;
        b=Lw872kWxWi5esfyvZg344Ba6DwVZRCxbLjD3VDyYXVWaBr8diFkjo7FZJq6qdk0tV5
         g24gWvfucEPZrgMrx3mMg7Ayd7OSMnxhoiLfTAgHSphibxD0EvDsWm6gE7QhlTm0WXPk
         ieRQxMvmA+UC9qNM3KjuPGFOL5kSTvlJBFbBfS8ENQwxSJFFdtF6FP1hLGR0gQFm19nL
         8OFstCC5Cl7DOK7CcI8xrQhb0ZkBdZup5itcIVNqdG6Q7aP1ohkKrWiS2BmEdTYeP0Bc
         8IDseRubWNhfi2hqmIXVPDE/pQYtwKAfvcVGKFwBd4en7v8osow3TF00OZtbfL2kNPMX
         u9Yg==
X-Forwarded-Encrypted: i=1; AHgh+RoxlHcvXqlaov+b9bavWHDbIVUXC2Ry40xtBE+kInqC7SqWnWA//e8USNWmbWvGBao5rRUuEWrxBgkIyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRdvAsfTBulvStCS6XCyWDxH1mQAjdOxbTB8bMvCbEeBMsrnb
	5fqVVPRxkbe3IdmTG1XlitU3tUYSEgxzvmXJ20lSckFLY03mjaVmXmk1
X-Gm-Gg: AfdE7clwU7cq/uoqFxAcIt1Ek0NZQQeVIFcAmeqlcyd7HaqrOZcoTR7du8KhF/ia7sr
	nvfPiE8YFPddsUAQLvslV5lKDh4v0hUHpH0kwfpKHOgrvTPcBDlTrKqnbOWpUfnfN/t3xoJIEQm
	aPd0OejLWN4Wl2HwhLkZlekLkgrW0WCl8JnGLRweFaExvBUVNjlrQPM+iVy44erz63eFHsFwqq6
	omeu+HMzauHsvUM+n3VEJ5V9VStgHF4Em/3ONG/w+fFAhVstsrvBNe6jUtv1azjfazJqpbHVA++
	zEQd46D8HXzhUnVvuor9RDxCfhIAApLVPFEPsFlnL7umBT04fPkNM9zZhYxkMdb7qci1Fassm7T
	p7ncVnF4tTC2rdKczRGoCTtbUcZEjbg4ANmeZ3bH8GUBHADJbckCIj5m//Bf6QHl3jlPb3e8NR0
	vvwx2jjOMs8SdjjHWEiCSBNIikjROiYOM=
X-Received: by 2002:a05:6000:46c7:b0:472:1424:fc7c with SMTP id ffacd0b85a97d-475de54e182mr792784f8f.10.1782806480868;
        Tue, 30 Jun 2026 01:01:20 -0700 (PDT)
Received: from laptop.fritz.box (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475671d0403sm5651837f8f.29.2026.06.30.01.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 01:01:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	lizhi.hou@amd.com,
	Max.Zhen@amd.com,
	Mario.Limonciello@amd.com,
	airlied@gmail.com,
	karol.wachowski@linux.intel.com
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: explicitely forbid exposing pages from get_user_pages()
Date: Tue, 30 Jun 2026 10:01:12 +0200
Message-ID: <20260630080112.1117341-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We recently had another incident where two drivers put pages they got from
get_user_pages() into a DMA-buf and cause quite a number of problems.

Explicitely document that this is not something exporters can do.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 71f37544a5c6..aa5af4f439c2 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -685,6 +685,14 @@ static struct file *dma_buf_getfile(size_t size, int flags)
  *
  * For the detailed semantics exporters are expected to implement see
  * &dma_buf_ops.
+ *
+ * It is explicitely forbidden for exporters to expose buffers they don't "own"
+ * as DMA-buf. This includes pages acquired by get_user_pages() or other import
+ * mechanism. Not following this rule can create numerous security problems.
+ *
+ * It is also strongly discouraged to expose the same backing store through
+ * multiple DMA-bufs at the same time. This eventually creates aliasing and
+ * cache coherency problems which are extremely hard to debug and fix.
  */
 
 /**
-- 
2.43.0

