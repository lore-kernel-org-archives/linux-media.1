Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7DD3AC0F2;
	Thu,  9 Apr 2026 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742596; cv=none; b=guaIc4NO2ay3mysZnqA9b+fycfDglkpbdG7Qm+fba14u1Qsj0AZmABZaGx6GcGi8xa+9itmxC2fcDpWp64KuM12OQpUo4LhN5GYMC+RxR4szMJqqtOU1U8NG8fhUqCmqjIb2yai4/6yhzEd+U6T7XHowWbshKZ8L7fSllHPGeVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742596; c=relaxed/simple;
	bh=97xYRe7oX1AaIVjWvu0MEYS7PvyoNJ2dyboXx71xStI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pC3GHBKm9ugWCN6b8/2kO9X4TSrC+aC52+OoTrCEVkub60Ns8RF+Ou4TGIPTC4QQB/SeQzd6DTNJ3QP2c+uMHBQcpnhfOmRzd4pVOsLDFU5Mh+PxzbTRGzNbFoQNp6Tun1G2He79fCOlgGOnFqNuVcdKhifvR6vLb0fiidu44AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1hPGGuhf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1hPGGuhf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE17C4CEF7;
	Thu,  9 Apr 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775742595;
	bh=97xYRe7oX1AaIVjWvu0MEYS7PvyoNJ2dyboXx71xStI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1hPGGuhf/tqwBqkId0zyrcAnOe235mHgWO0IcNUpKVNu2qVNTTauE7jiTzWrFirdi
	 adUiKqgUbdlDGsHEOqCZWrXkFK8Fx/t+Hog0sUbVJjF03rLOCzirLjUyQnXus6RJUK
	 9DRAYN/x6kbRvwm46TaB719e3pYuqOMV6TrLvMXs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH 3/3] media: stv0900: bound DiSEqC reply length to msg[] size
Date: Thu,  9 Apr 2026 15:49:46 +0200
Message-ID: <2026040944-postwar-sway-810f@gregkh>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026040943-finishing-daredevil-d6e0@gregkh>
References: <2026040943-finishing-daredevil-d6e0@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=97xYRe7oX1AaIVjWvu0MEYS7PvyoNJ2dyboXx71xStI=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnX11W8PJVy8vycVr1Qts0fZ+hu2+B0wuTExi0MD25c8 RTo/a2+qSOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmcngiw/wwa1W1zalSGrKv OmqWrpnG9HZjBCfD/NDl7Rl7V52Zu3DJ9+gNNs/Wei3czAgA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The FIFO_BYTENBR field is 4 bits (mask 0x0f), giving a length of 0..15
but reply->msg is __u8[4] in struct dvb_diseqc_slave_reply.  A faulty or
malicious device reporting more than 4 bytes will the array and clobber
the stack.

The stb0899, tda10071, and s5h1420 drivers all properly bound the FIFO
count against sizeof(reply->msg) before the read loop, so do the same
thing in this driver.

Cc: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Fixes: 99277b3824e4 ("V4L/DVB (10803): Add core code for ST STV0900 dual demodulator.")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/dvb-frontends/stv0900_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/stv0900_core.c b/drivers/media/dvb-frontends/stv0900_core.c
index d15c55de2723..0ca6b6d81273 100644
--- a/drivers/media/dvb-frontends/stv0900_core.c
+++ b/drivers/media/dvb-frontends/stv0900_core.c
@@ -1773,6 +1773,8 @@ static int stv0900_recv_slave_reply(struct dvb_frontend *fe,
 
 	if (stv0900_get_bits(intp, RX_END)) {
 		reply->msg_len = stv0900_get_bits(intp, FIFO_BYTENBR);
+		if (reply->msg_len > sizeof(reply->msg))
+			reply->msg_len = sizeof(reply->msg);
 
 		for (i = 0; i < reply->msg_len; i++)
 			reply->msg[i] = stv0900_read_reg(intp, DISRXDATA);
-- 
2.53.0

