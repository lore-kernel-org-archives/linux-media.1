Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED73A5459;
	Thu,  9 Apr 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742588; cv=none; b=B08YZL0rbYGyKNoTw8mkgrOyt9jHEAmnTabTjRbocYDAkUGk8HFQmYo22Kl73Z8AuywpnKbtplrchpbicCkKkGxOnwcmWYiHmjl4ATEga1Lfd2QtrHk/rCltSyYFgD8g+DNcdnExUCaCsKwhUl2opfcQpsUqUB35pNEUeSKf2N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742588; c=relaxed/simple;
	bh=Accc1DDK59ZqoGajH/rYDRfinvJ7K8paT0pHNtx24w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvSS5ckTIWsAKdnREhDkfqcon3LV2yAUDZ13dbdDHzfLHNW6VPI27uvAKssjkY9C02Fa/f6lNUxhtTd19Kq4hc8yzK+qp8LEZBQ87UT1FmbvQQ/3aBmz1gB9PAS7ZSqETAUvFMhD8mZJcmEA6HlHMYTjrDxgJDdWRggCfPd1gvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WQH9jp1/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WQH9jp1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57965C4CEF7;
	Thu,  9 Apr 2026 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775742587;
	bh=Accc1DDK59ZqoGajH/rYDRfinvJ7K8paT0pHNtx24w0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQH9jp1/kHy0PEbkH1WQaylDACvj/DqUGwPtg00UUmIKUWzf4BZTU1L9i5lixxtrJ
	 /zrZfH5/6O1/gwzWv4iCwVh4iOWQgU9dA8EQtJrHsp2wW7opcUidWoiPyQTI3l5Pou
	 8/X6yW50v8T4HzOU2MxXJiKKjRMMjDadZzIadOK8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH 2/3] media: stv090x: bound DiSEqC reply length to msg[] size
Date: Thu,  9 Apr 2026 15:49:45 +0200
Message-ID: <2026040943-goliath-both-2ee5@gregkh>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026040943-finishing-daredevil-d6e0@gregkh>
References: <2026040943-finishing-daredevil-d6e0@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Accc1DDK59ZqoGajH/rYDRfinvJ7K8paT0pHNtx24w0=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnX11XYCU3YVVBzM1V+be/mO8ryPLsebgjX3NRTJy4ae +XZdvYjHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRg+UMC1aYMR8syYkv/Oe4 wUvq6qaa+R8uRDEsWHzVP6Wde5rzPMsp3i/TyxVTvN8/BAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The FIFO_BYTENBR_FIELD register field is 4 bits wide, giving a length
of 0..15, but reply->msg is __u8[4] in struct dvb_diseqc_slave_reply.
A faulty or malicious DiSEqC slave (or i2c bus glitch) reporting more
than 4 bytes will the array and clobber the stack.

The stb0899, tda10071, and s5h1420 drivers all properly bound the FIFO
count against sizeof(reply->msg) before the read loop, so do the same
thing in this driver.

Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Fixes: e415c689a884 ("V4L/DVB (11579): Initial go at TT S2-1600")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/dvb-frontends/stv090x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index 657df713865e..d4bf6d28961a 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -3902,6 +3902,8 @@ static int stv090x_recv_slave_reply(struct dvb_frontend *fe, struct dvb_diseqc_s
 
 	if (rx_end) {
 		reply->msg_len = STV090x_GETFIELD_Px(reg, FIFO_BYTENBR_FIELD);
+		if (reply->msg_len > sizeof(reply->msg))
+			reply->msg_len = sizeof(reply->msg);
 		for (i = 0; i < reply->msg_len; i++)
 			reply->msg[i] = STV090x_READ_DEMOD(state, DISRXDATA);
 	}
-- 
2.53.0

