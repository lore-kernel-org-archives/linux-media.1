Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039661;
	b=wyHRTOn13uKJ4YpBb+JHifTQHMSikzwd8WDMelckHCTvj/o6/RDDZ9kYbVToQPuRa2Hg
	 rAY7UlwDiiNrZFCnjInNaD2frqZmPbbTwYr478ZFMwDzTb0AWWV3FzEgmUADHHD0FCyeQ
	 bzx5SMTx2UKvUdOo1JAv9NIHZFONdzvAX3kQco+aAfHQILvHV2CXxSHiNps2eThXujgJJ
	 dfwgaQWrdBbHu72PTF9xpw8DMK4kbhDoao2z5jin8E1KPbs5p4P8ZBbQZOXROLCThsEgB
	 GHHen2tMOTlfPXxXtFawX2LoMI5m4PJ0oC9SrUAd/5DQSWxfvHvXVR3Bol05MY4hUkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Smx2TSuO0j/SzyUeLuCkLYEZdgKqtSx2w/OX0HqvbIc=;
	b=j7tcOWCAnNCGm0oPShXEwOaQaK4EJaaqJFz94ftWuYK4cEd1YZYb/MU9AkIQthYDPHfX
	 X5MqdHutkefWFkHIAJ7jglEXmTEnHhSARY0u1DqL1VlANJOdWqPZOv6WZlIO/ntqAdZbc
	 E1oUieEs9mk+scvbC23Uza0KXBfkdiGxCPfX1vUax+KPUACCcGvly9n9dZMguWjPVUxrU
	 FFmd+z9LxH68PLEl6ICH3FDpzuocBxuel5j58AGssTRyEkioRbLkdsa+aDvlIlpfSLk7o
	 hBheJYO6OFrj/T6ctZs3Rr43R/wuGgijIlkq7XsRzMrJd+8U/sed+KxY/DlX/iW4pEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b369cWiL;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B660A2602
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 22:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46B660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b369cWiL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so16962475e9.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 14:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039659; x=1795644459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smx2TSuO0j/SzyUeLuCkLYEZdgKqtSx2w/OX0HqvbIc=;
        b=b369cWiLlmum3ZoscBhBpZkWH6q/jOJQVUcOZpIH8FFYPzZ7SUfKJ2lj+g1dZtBXK/
         Cl28x7gZQwXbg2JnkB0evQMtjHP2hQPx8j1RMOvPKu3L7UHMlnnUtrLgyrJ0vd/fFptw
         ONU9byLLV8nqHiQTKQEiChuHwSA8vHybVEjjQrGGylfNmGZEP4sQOIx+tMw8YV1HRrHk
         B2cjBQt03YgAYE/74HTxwmOPD71zIQz8CjRt9hIaC8bEKUux0PDo34jbOdw/CkeiRWRh
         uk7D0eDDfnjVxxobipPiWaIMPR93ZBoq5YsT69rzj/81JD7uWyrSUle5Z/CfvSuHk3RF
         qi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039659; x=1795644459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Smx2TSuO0j/SzyUeLuCkLYEZdgKqtSx2w/OX0HqvbIc=;
        b=vzeqoQq6GrTHw07P4IgEkRY9wbfC7gdCEXMZ+IgPChJZE7tDb9RIr5gV0C5P13w5Bb
         cH5Tv1RhYA42mMqZxrA0VJMecz7bkhwQ0tJg2faPYPKu+IgMIr344N++C88Y7hke8oiA
         vREjAz6Al5MoGADfhJrz0KpX+caIL+gtucjwwqwIAbbnKd4a5qu9NeJZ0gRqRvuwpBdU
         JLPGDQr1Vdr5zgSr7X3IeHC5j7anzblmsa9h8/q+r7Ul3CcGNMdJgCRqf8QvucKU8fVj
         pnY+jznvYs9WQqPrq1+HcbiV2yud0yRMxZi7RHOzTQ4TdT9OBH10IRcRJbGGfYUBMGlz
         RdGA==
X-Gm-Message-State: APuU4Z/U7ny4T9VoX6KK8NcuvBuljoYsdtiz+++YxEnSuWPQjdq106vH
	qB/LV71rhbB/UM4yeErwb0huu27ufHt/kq9dMKSb205jaJg/IIFJebBkkvdybQp6
X-Gm-Gg: AYBFou3S5s4KjJ28dvZ9SZ49xTz4/VALl99obyxrOmholg7b+WCzJVaBFQs1kbyWZ8R
	BKgwMbfOQUURtoDjJI5jwGGUKVsDd0LNy8I068qy+pDw5bhr4Uf3PzWM01ePAKmmxMt0zPZ8cR3
	p/hvm9g+VFKOJCN3pbyo8MmNruvlyrwfGuC3bUGtEBGo4LRW0nE0VovhSrUwSrRjiHyGX2kXW/m
	BINwwpU/p9d7KkeSD/K5+S6q+MMjM6P3BTh8DICZT1CLXknRLqs5n9uF94u9AgpbACUrAOBferg
	YDJljs7H4cHYJ0Ou4xHStnYJxLTvJhV9zzk0TAl69bbzZjbR031DBUk/COz2Mbb2MdfqKQtdHqw
	UTvMtw6hyvrZZbtolh2aEK+HKJZmKWWL2zQPkeh6pK+1prHY+15xVLsZRvB3oC2xG72PzfY1DbF
	kn4RBFj9PmnbBe4hSoj0oDRONw88AXlhB4kyZNY8Kd4FNZ452M69+Kks9i7A0uu5Pl7mDJJEhPp
	zuH2QDUZQkb3eOzSt4iLD4kISsQbNHJBKRgdpb4jPLD4tEWUVY1ug8i/NFDch+CkZ14sicXkE7J
	SkNRuFYyuAgDrQTTuXshrZvAVPXcwJCvfwwrq3xCYAxBTMgCb6Bh33wRdoMyTwkSzZbEASZLesG
	bBH5aWIkHJl+xZIaHeg==
X-Received: by 2002:a05:600c:1906:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4bb7da13900mr75204905e9.10.1795039658995;
        Wed, 18 Nov 2026 14:07:38 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:38 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH 1/3] media: cxd2880: do not keep the attach state in a static variable
Date: Wed, 18 Nov 2026 22:07:30 +0000
Message-ID: <20261118220732.29246-2-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
References: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
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

cxd2880_attach() declares the pointer to the new frontend state as a
function-local static:

	static struct cxd2880_priv *priv;

The pointer is only used during the call, between the kzalloc() and the
assignment to fe->demodulator_priv, so there is no reason for it to
outlive the call. Being static, it is shared by every CXD2880 in the
system: when two devices are attached at the same time, for example two
Raspberry Pi TV HATs on SPI0 and SPI1 probed concurrently, one call can
overwrite the pointer set by the other before it is stored, leaving both
frontends on the same state and leaking the other allocation.

Make it an ordinary local variable.

This was found while running two CXD2880 tuners on one Raspberry Pi. I
have not captured a failure that I can attribute to this race; the same
change has been running in an out-of-tree build of this driver on two
Raspberry Pi systems with two tuners each for several weeks without
problems.

The change and this changelog were prepared with the help of an AI coding
assistant (Anthropic Claude). I have reviewed them.

Fixes: 9593810cd42a ("media: cxd2880: Add top level of the driver")
Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
---
 drivers/media/dvb-frontends/cxd2880/cxd2880_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
index 0d058b59a..4daebb7ff 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -1879,7 +1879,7 @@ struct dvb_frontend *cxd2880_attach(struct dvb_frontend *fe,
 	int ret;
 	enum cxd2880_tnrdmd_chip_id chipid =
 					CXD2880_TNRDMD_CHIP_ID_UNKNOWN;
-	static struct cxd2880_priv *priv;
+	struct cxd2880_priv *priv;
 	u8 data = 0;
 
 	if (!fe) {
-- 
2.47.3

