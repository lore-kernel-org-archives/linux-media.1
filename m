Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAA0397E85;
	Fri, 10 Jul 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673638; cv=none; b=ai2VYVHTRiBZf/pBohMtYJ1B/deLIb8Gwd+3L2CA5SqCAfjwJX0h1Gc1tDfSOro43lbn992tab5o/dpm8O+38DOOxQQYqUwHiJKfZoMTYGnFaHBPwT6CtmdIWT2wctDx/MTLDNH0HfNjdCnl/a8NrMiu23yVrnDOUstx0+iyVAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673638; c=relaxed/simple;
	bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBzqWHPaSJ9aNSzFQhjq9Dw6pbaIGyP8b0beB4kz1/B8zoK1dUVGi31Hwf3tTOiyiI+HCh+JWCvvsEAcziJPJ7Q3BM1YdDKA9CxwcTDtqt7C+2jg0a1T7ohXY8GA1eT2JqSg+Os/IM5cVniuCc1ObIygOvXbUTljoNH1cgV9/wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=g1gXM920; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=E2o7NHWi; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="g1gXM920";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="E2o7NHWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673629; bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g1gXM920p+Z60wPFjxfbByNjcAl0cWeXNo+eym/fae8o7nPg3PqNf4U22vDs9kcmX
	 4iH++0/sscOqYRt7I6qZvscH4trx2lh/dk5pfJxLUuWSIvFn10L3nFy/ZOac8YA+FI
	 cjiDE95mOW08flRTOdd7AbFnYH5AoBvoQDWr7e3sKvxXHRyO8HpXgyiYPljGmrFnXY
	 3dQ2SbQMr6nvb/X7C9Oc0cj5wi93pueMrhsm5S+ddfDOQHug1Mdk5m+JuWSYCw8i8i
	 JGujd55xcJKPVsx/KnTUMzbBzjmyPy6TDEdhV0r15697ZI9eFytighdpyM3vpoTcjU
	 +41eTelYS13xQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 24DBA40B2E; Fri, 10 Jul 2026 09:53:49 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673628; bh=+TpKe/mgJklkLKnDljH7vM67ggh0YzGDXp06CXV8Mjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E2o7NHWiXW+yMtsmOo/R6CSiyYMpYiNSFZiCQ63C7tExL0mapqpa/oWZO/mDDQPmm
	 /uQcnwiadwxftLrIJ/6uubS5ajhOIUE26zIGGv/PinKZ5fpw4ofxnUoRSZX18ENMbB
	 oGvZPd5hvCkTBjDRDzT67wf6RcmrncoD50csB/oQy1bJCkv912bpdBZz70B7k31NpK
	 shnDMrpM2l540oGX7iMA2IaklApxqLxcElBVx6QHoH+QEVBnGxLJn91lFXP1+lNAxW
	 ILgHvHTmwOe2v7jOvmOrnralcodO7S91rGmhLxx8uwJ87Dz/Pbd1U9ATjkPpqGL3Hx
	 2zJAeNHBy4AIA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 2483740AF1;
	Fri, 10 Jul 2026 09:53:48 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Oliver Neukum <oneukum@suse.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] media: streamzap: Add missing rc_unregister_device()
Date: Fri, 10 Jul 2026 09:53:29 +0100
Message-ID: <58e043bf525c8ea0410619d738b5104eed15d286.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If usb_submit_urb() fails during probe, then the error path is missing a
call to rc_unregister_device(), which will leak various things like the
input device.

Fixes: 42844992664f ("media: rc: streamzap: Error handling in probe")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 307985d74fe8..41195ad82734 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -365,6 +365,7 @@ static int streamzap_probe(struct usb_interface *intf,
 
 	return 0;
 rc_submit_fail:
+	rc_unregister_device(sz->rdev);
 	rc_free_device(sz->rdev);
 	usb_set_intfdata(intf, NULL);
 rc_dev_fail:
-- 
2.55.0

