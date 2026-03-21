Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE112C028F
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774119865; cv=none; b=WGgrqrfWc9qDNc1aIVJwZ69ccpUrAjjyQbiJwKgVCQohRG2/0N+OXn7rBvJV6SXQqCs9SiPF8y4JQ5OKL506v31ULRhOZQJ01RP/bBJjpFOk9fKbS57efbkcW5v6g9nSsS9zwCRHYlNyKqWr7ZWk69bpk2G8OGJJQkMkGeTZOoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774119865; c=relaxed/simple;
	bh=98FhYsa3Xwj0bnM50GDKCVbtAmjg0Vi0ajxPo70RzS4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cN/PfuE17Qwf5LDzSpamoXZBIzZX7wnV4hqaD7GfyIP4GoJgZu9k91aOZYkqDTvUkHJjAcGEPSBOsTOZ9tINCciuOs9Ai4XjBnHBkPpxVSHSDrihxdLx6+0W8JMMXO4XXPnLZ461IvBfdZzx+g8UpxaWd1NQpNMtHv/XfCt/IY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.139.102) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 21 Mar
 2026 22:04:21 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH 5/5] media: lgdt3306a: streamline lgdt3306a_read_{ber,ucblocks}()
Date: Sat, 21 Mar 2026 22:03:32 +0300
Message-ID: <20260321190347.21213-1-s.shtylyov@auroraos.dev>
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

In lgdt3306a_read_{ber,ucblocks}(), there's writing of 0 at the passed
{ber,ucblocks} pointer before writing the real value (behind #if 1) --
this makes little sense, and the 1st write gets discarded by gcc when
generating object code.  Enclosing the zero-write with #if 0 and then
replacing #if 1 with #else makes a lot more sense...

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 98af9c0f3757..c118ab36c343 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -1745,8 +1745,9 @@ static int lgdt3306a_read_ber(struct dvb_frontend *fe, u32 *ber)
 	struct lgdt3306a_state *state = fe->demodulator_priv;
 	u32 tmp;
 
+#if 0
 	*ber = 0;
-#if 1
+#else
 	/* FGR - FIXME - I don't know what value is expected by dvb_core
 	 * what is the scale of the value?? */
 	tmp =              read_reg(state, 0x00fc); /* NBERVALUE[24-31] */
@@ -1763,8 +1764,9 @@ static int lgdt3306a_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
 {
 	struct lgdt3306a_state *state = fe->demodulator_priv;
 
+#if 0
 	*ucblocks = 0;
-#if 1
+#else
 	/* FGR - FIXME - I don't know what value is expected by dvb_core
 	 * what happens when value wraps? */
 	*ucblocks = read_reg(state, 0x00f4); /* TPIFTPERRCNT[0-7] */
-- 
2.53.0
