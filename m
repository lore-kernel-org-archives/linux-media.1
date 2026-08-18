Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9137F315
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 20:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086476; cv=none; b=QbyxZ3ZtE+A2rsLWy4GNaVRycuh28Y25n+3qzKNJ6yx+DqJXd7dABAvwx2HQT+HKxXYY/pEQr29a7A2D0b83Mzy5Xy9kNsoRxQZX7MQjI+SQT1K/1DEj0f/pORnM4E8cPt9tzyCW3wEkHzgpVSe/DmNAUKMQS02WqeL+X4MVsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086476; c=relaxed/simple;
	bh=YAWWOTQg8yHW7eNOrybEKMjw9WJgG4X5lpOZ0c1pCRc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jIqLspO6oI4Ii6+dOw/WyJfwJ5+tI6S8ICVPWX/Ar/EVoKHOl1eO/DI+9pC6DWVj2f+gEu3MkAyie99G23irsAAWPbsoFrxuMkrAm5LvfuJcDvshUf/R+0R72QBuCbh+lb+4z+l+UJ1OUuajascj7vdUErHzUSXheJmdV5hYxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (91.79.33.236) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 18 Aug
 2026 23:39:20 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] media: rc: rc-ir-raw: drop useless decrements in ir_raw_gen_{manchester,pl}()
Date: Tue, 18 Aug 2026 23:38:30 +0300
Message-ID: <20260818203832.46030-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.55.0
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

In ir_raw_gen_{manchester,pl}(), the paremeter max is usually decremented
while checking it for 0 but sometimes that action seems fruitless as max
isn't used afterwards -- drop the useless decrement operators...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
The patch is against the next branch of the linuxtv.org/media.git repo...

 drivers/media/rc/rc-ir-raw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index ba24c2f22d39..ed494be8896f 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -362,7 +362,7 @@ int ir_raw_gen_manchester(struct ir_raw_event **ev, unsigned int max,
 	if (timings->trailer_space) {
 		if (!(*ev)->pulse)
 			(*ev)->duration += timings->trailer_space;
-		else if (!max--)
+		else if (!max)
 			goto nobufs;
 		else
 			init_ir_raw_event_duration(++(*ev), 0,
@@ -491,7 +491,7 @@ int ir_raw_gen_pl(struct ir_raw_event **ev, unsigned int max,
 		}
 	}
 
-	if (!max--)
+	if (!max)
 		return ret;
 
 	init_ir_raw_event_duration((*ev)++, 0, timings->trailer_space);
-- 
2.55.0

