Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76AC2C028F
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774119756; cv=none; b=PwJBMU29J1VmYAvQo63mSe8VqAthDcjZZUHqA/sIrI8tea2zpqQNwlRkgExHcNXoNAtsBhMiqlcxGsaN+RIpwuv++7OjXcj2yxnd30i0AM2h5UedD6/v6RzdSlaZxyIp6l61fgVPUGNpt2F5fF5a8bbHA44X9nXhz2mQ5+EWxmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774119756; c=relaxed/simple;
	bh=UUYIl8a8dHxKDIXE+wtQSivqGgCp/49LKbngw1u8BIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bge8pNe275+zhK8P7A1iqLadL6Gfe48fclEBB9quGoiiBOJApDXUKHQkMIMLs/aVBX7TgFZsGJLbV7a3ds+siq0aw98hBj/gK1wOT6cI2zwR+DelIG1tlmUaeRqY2zZaQJFyk5Woh0Y+/T3JQjXwL0xizn5WRgDEAkZN7gBClr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.139.102) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 21 Mar
 2026 22:02:23 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH 3/5] media: lgdt3306a: drop useless variables in lgdt3306a_set_inversion*()
Date: Sat, 21 Mar 2026 22:01:40 +0300
Message-ID: <20260321190143.21123-4-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
References: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

In lgdt3306a_set_inversion{,_auto}(), the local variables serve little
purpose -- get rid of them. While at it, fix up the indentation of the
functions' parameters...

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 458ff198e659..d586f9ca6a86 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -731,26 +731,20 @@ static int lgdt3306a_agc_setup(struct lgdt3306a_state *state,
 /* ------------------------------------------------------------------------ */
 
 static int lgdt3306a_set_inversion(struct lgdt3306a_state *state,
-				       int inversion)
+				   int inversion)
 {
-	int ret;
-
 	dbg_info("(%d)\n", inversion);
 
-	ret = lgdt3306a_set_reg_bit(state, 0x0002, 2, inversion ? 1 : 0);
-	return ret;
+	return lgdt3306a_set_reg_bit(state, 0x0002, 2, inversion ? 1 : 0);
 }
 
 static int lgdt3306a_set_inversion_auto(struct lgdt3306a_state *state,
-				       int enabled)
+					int enabled)
 {
-	int ret;
-
 	dbg_info("(%d)\n", enabled);
 
 	/* 0=Manual 1=Auto(QAM only) - SPECINVAUTO=0x04 */
-	ret = lgdt3306a_set_reg_bit(state, 0x0002, 3, enabled);
-	return ret;
+	return lgdt3306a_set_reg_bit(state, 0x0002, 3, enabled);
 }
 
 static int lgdt3306a_set_if(struct lgdt3306a_state *state,
-- 
2.53.0
