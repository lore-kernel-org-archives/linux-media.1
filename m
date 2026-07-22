Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03B2C21E6;
	Wed, 22 Jul 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715821; cv=none; b=Za5yhtfeIOd5kHbiGAAYgwk2/JS7DnVHAKI6hs779slQG37ng7LkNR9xXSs0HHy2ag4/5XWmVupm1+RgdKl0tKZUpoC1W1K5n00US9bt/MQNO2Llxo0WyX9yYn/Wv4tqow7u5efvTdYRWfDVFs8n8INoHygQcexa2EpibodggAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715821; c=relaxed/simple;
	bh=7QPx3+atZCgXOQM3zfRS0Xo965HSLxG9TQ+UNIgrUT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0CJXgr6Ik7A+7Fo1v/qibcxVAmiHFki1hxeFDasJ7Mbmae/X/Y0CZ8rsm+IQumNH6v+/dZAJAmMhQ1xDKQV95boMW+/540KeooiZMyiItkCmV6LozFfvx/7ZuDbny3418ocIN5sHD2Mhd4OgZHV2W+AH+iiQDgYJjNThOJ9gdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=pd4dUw6Q; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Bn1GrctA; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="pd4dUw6Q";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Bn1GrctA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715818; bh=7QPx3+atZCgXOQM3zfRS0Xo965HSLxG9TQ+UNIgrUT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pd4dUw6Q6KbdOsxIfa+d1mLX4/iaqeWnZyds4gsglJPbxixXhPk6YoYup0j9/6OIi
	 1dkPk4bQJodtyYFiamvXeuViG3GXxnjGH35LQap68eierAJXza8qaoGniVscqmSZNA
	 orFzdPaMRmfpWGmn+AiOl9rbxcj63/Vby7nQb5nP4TPMIgCxtjrGiGMH5yAuAkL6He
	 wfpyyz0JCsSND8Oh+myX0Kz2Uhasxr3PPJY0xzr7GePlCgg+AcmaTgNbxCL/jhL9dw
	 V5r7GsWZC9n01dQYkwz/T3JA9/JSM2aXkrHfKdHTU6QB6jNxfs5guzy7nvhL1Ot5eR
	 ClILL7AnAy/aA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 25E9A42534; Wed, 22 Jul 2026 11:23:38 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715817; bh=7QPx3+atZCgXOQM3zfRS0Xo965HSLxG9TQ+UNIgrUT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bn1GrctAmq3tJNANhIiDT9jsNTrPpMtzJWzIArAWPmNakfD/SGtwEZu/Lo263FZ4t
	 oIFsHJWMSaqHW8Qd7QuTugvWpHO7p/bakzywmVE1FP/RjIhIMuBA5IP+moBSq+gKgh
	 p8f+8zr0F/6gcwwEhit3sEc6IX/KJCRA5fwFRdyMMiy05kPMgjiL+QiqIXt1fK1VaK
	 ExAADwhLts9P2WNK2keC+N2H5qyvFk6BATgHtLp8tLl0ryappvXyosuM9jopDLWwCA
	 HrV2Ki7jeOvr70nsr6FL5x+f0IgV3KNaxnAGXtI5JUWOnviqJXYqJC2FVeAP2oVRIj
	 Uo62q9q9GwWhA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 6B53842528;
	Wed, 22 Jul 2026 11:23:37 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/13] media: redrat3: Ensure all urbs are suspended
Date: Wed, 22 Jul 2026 11:23:16 +0100
Message-ID: <2c0674320c25380fd6eea0117fab7304979933d2.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that the learn urb is stopped before suspend.

Fixes: c49fcdde38cb ("[media] redrat3: enable carrier reports using wideband receiver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index f86efcb74e6e..994d4864520c 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1170,6 +1170,7 @@ static int redrat3_dev_suspend(struct usb_interface *intf, pm_message_t message)
 	usb_kill_urb(rr3->narrow_urb);
 	usb_kill_urb(rr3->wide_urb);
 	usb_kill_urb(rr3->flash_urb);
+	usb_kill_urb(rr3->learn_urb);
 	return 0;
 }
 
-- 
2.55.0

