Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552B3F8ECA
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 11:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151371; cv=none; b=RMA3zj/cqEzwXFKzvDtIS5ubFNtFmHRtCTehIA3t8Ca6yjXpyKlFYr12Z1J4rDCtlIX0T+CidfGGZ9rPzxfXR3+rARumAGCE/LLWsOwx6u4GbjjaOJS8x70HFPzRoW1TZGJAV/m6a4cXitfvTjrMDCsQ6Lp9kotBdajJyVpdP9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151371; c=relaxed/simple;
	bh=GvGPNpCEnQDfHxHOcxa+Ci3ycUkDkZuGgKa+12rrbsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VaP40UbV2mKuf1n2jAIQ8/tNeey9Y0JYz/dCHTQJ/AThVoRtkIzWgfU+ckxnuGM5Jb3GRnZxQqJ7lZAPB7yPdA1GaQvCNqXQXY+ppq7JxZD0uvvGnT/YoDd2X1mdRKoakXJ7lbInCaqyxTjpeQiGuGNpmiy24ceNyMDLIznfHq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC5g6P14; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC5g6P14"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cca0c5799eso23158985ad.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785151370; x=1785756170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5E1s8oCcP+GEyqdmRlB9Q75yjWLw8arRgBTU8DpxFM=;
        b=eC5g6P14I9t053eUr/GN5Lt+Nxbeo/u0iI+sdxSewr+leP2TxyjPYEIrvWZq91G8c8
         Sml6qnrP18jamPW00yOd/YbU3jOpg8b2NTrCOqpo3FN0F0PVeEGjVip0TL0MPPAY6mBY
         cFr7dfi7YI4NFynXvXafXt0Hzm3AcQPU67Mgu+WXDKRF6LVswJm4YKiw8HHUg4o3PBgN
         XbY4/jKcZDbmZOzTs7q8LbMUbKlQvV+66FWq2XL3k1Jw0dY2MML/NQ/gTcL79Ohk4MqK
         G74+8FR+kM6DVvMukNNcfRoEg6gM8CMe4hKp11NIA2jW9zYQNuZTnJ1pWEdNuCc+l1tn
         8XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151370; x=1785756170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5E1s8oCcP+GEyqdmRlB9Q75yjWLw8arRgBTU8DpxFM=;
        b=p3hG1s4Q+RERqzDi0xfT8RDjWDS2JEbx+sxTx3dwsTpmNmHMqDwhsuXbXKbId/BgU/
         mco4R6HJt9gydt5vGFN0m2i3Ufk2uP5lXrRP4PXYJF5xjzYa0vayRJ9z87ugw/LZj6eN
         gH/11zpKD9dlOKV5vU+w9B4qjppbjxnVswAOoaAB7CB4JnEKRj1+Y2HckSZHaPxrVWtl
         1pvoEOcZehKneQ0qBxjU/ZDDBBZ+oNR6U/DB4BwTuKXNjhByik18wK9njk9uObLakMPg
         Wx/AD7o8rfPmDWaxR3mwPWyg7nN+tRFMNqs8g9NC9ajZ3Ne9DHYEhFuBsqx1ogAcnrbt
         KizA==
X-Forwarded-Encrypted: i=1; AHgh+RpJD6BLeQfM0WX1SsHL+2P1Oec9jb4ivZUeOb151WP4hdX5wE4l3OfxIBVCia3vhnq6s81/juyFBSTQyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnLxw0S16JwZjWFET3jnt/R3hACS4KqI8w6VEHh67oCqnyylk
	h9VJ5mHWVUftUdcxwB/C5JdSgzkPX5YhVuhV/27dX84/OA5LbUvenpCd
X-Gm-Gg: AR+sD113P0W8TKNddx6l2q5VeWg3TZlPZ7PQl+T6aIrxnOOVisyvrLIW9Ll4k/NS+nC
	CAKuSCB6E11875UY4swCRVYu73xcz3yQ9QaZoMj7lv/peZRuFOKLngjmSXc6wbcBIa2kTQSWLvT
	wZF/SwI6TrcmVSz3bX0FySeufIAhm/0m0PfkeYYmNS3/uchrzGQ3Hj0EfAuxoHLgJ9rSsIjyGiV
	LcMfSt6cyBbLkIdWg7vvl0yAecfIbdBu1QqAc5MA6pxJc7NNjpVDSreU2z1ip3alCda1s076MPo
	6D4rSgMxKtFOTFsH9S4UjKtVwFjg1kLxDGSso7evo4vvhfrVYzPxd94uq394XJ8jc8MpzuEGSz/
	rS0yG0vh0a5V5nT5MdanuKTF18CF1HzvHBYsPq2AEdV/+Yd/nBSn9aGCIsOx5VMjMGsGXdp9+cg
	Tjgj4jMEyC53Z+K5sru2U=
X-Received: by 2002:a17:902:ea0e:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2cfde6880fdmr74010545ad.7.1785151369490;
        Mon, 27 Jul 2026 04:22:49 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e3e0asm32938925ad.29.2026.07.27.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:22:48 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] media: staging/ipu7: fix async notifier leak on init error
Date: Mon, 27 Jul 2026 18:22:39 +0700
Message-Id: <20260727112239.812159-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_notifier_init() initialises a v4l2 async notifier and then, for
each CSI-2 port, adds a remote sensor subdev to the notifier's
waiting_list via v4l2_async_nf_add_fwnode_remote(), which allocates a
sensor_async_sd descriptor and takes a fwnode reference.

If parsing or adding a later port fails, the code jumps to the
"err_parse" label, which only drops the current endpoint fwnode
reference and returns, without calling v4l2_async_nf_cleanup(). Any
descriptors already added to the notifier for earlier ports are
therefore leaked, and the caller's error path does not clean up the
notifier either.

Call v4l2_async_nf_cleanup() on the error path, matching the cleanup
already performed when v4l2_async_nf_register() fails. This is safe as
the notifier is always initialised before the loop is entered.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index cb2f49f3e0fa..c626de051898 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -233,6 +233,7 @@ static int isys_notifier_init(struct ipu7_isys *isys)
 
 err_parse:
 		fwnode_handle_put(ep);
+		v4l2_async_nf_cleanup(&isys->notifier);
 		return ret;
 	}
 
-- 
2.25.1

