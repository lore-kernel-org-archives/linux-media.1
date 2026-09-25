Received: from mail-ej2-f22.google.com (mail-ej2-f22.google.com [74.125.228.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F50D4E06ED
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.150
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361727; cv=pass; b=iaePq4UvNHrpPutd0iOXQo556I3Sm56fUPu/bUA0QmB8h+YVoJ6xazyKkcjOjsI6MxDJvrkeeK+2Qf54Ei/AFDIf5gRUMaxU/Rbosdswv2YHoIpWs+kCUH3eu9QytDxDDX6kuP9WIJn7K0Eea3iF9VZbxYRQcT1TBjbAa1L3Il0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361727; c=relaxed/simple;
	bh=HS7UjO0jQ6s+qLOgaF7cYDk1QhzxkXFUd4jz+Y1RB18=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oF4qr7vbIcWDxTLa3i5BERE6bxdnx+/umpl6r2l7YIHXvgTZP2DayUcS1L4ufN2H79pkkmdJHhdZY22QmLfs2wYZT1fBkpg5kUU2bkVUZDMohGtnZAp4uEr79dqTNOLn9LM5n6wrPnO4xb5Of1Wub/M7YRF/kpzp/+lJrGoJDfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4mPYDLL; arc=pass smtp.client-ip=74.125.228.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4mPYDLL"
Received: by mail-ej2-f22.google.com with SMTP id a640c23a62f3a-c2afd63c3e0so59014566b.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361723; cv=none;
        d=google.com; s=arc-20260327;
        b=GgXeBdj+vijG8hDXMB/70lAhMuJnVdShtg3JnvKkvS1uFpvYAoAaKb2WrM570KqMsB
         jNslmqL+lOQ6ccveAtTOainf4EWh32LaTQpOVPrEFzYXccofjqpHJvO8hFw4JIPS1aXt
         Knt31/CRNkAtu+nQbvqoab6/AcQeiokuMQgNqtKJfcRdIAEw24whso1VpvoGkyfd0yna
         3m0h7keSCzseSSTjpo69OAHbyXAeKHquiRILMOi5jIHeBq6ttjA7YoUdEdmkYm7lRD3r
         s2xT5lGkvJ0bP0gYvxvlzEL0lTTfAxkXKpAMPCCZdoNFbqJeyHfFg6shR1skSZxfKity
         /obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=1PCN/eJ30EXDvqgIEVywdLTEtL09HO8pRJxVwe8r1Ec=;
        fh=8J4griM79xQmDL3mx8CQ3f9eJXH8m3sDFtRjza+w8Gc=;
        b=MruhxRslyYDNl7vOMwYqq8+SrdxP00GiQzXGxOctrY9jV/n9XaKtz2FMTKZVFp3V9Z
         WRcbJv/V2hsvQ1lcaMkizOxd1DxlX5Xm1opowUkmL20sPETY/DcH/icZB59rVoY3cjae
         ShE6258nGseLxVi4EzlgyHoeYuNN60F0gBna7YOlc03JZIK39vhc4GhkYZoCxzDno3wu
         T+VSll+I8nUdGWH88HiHvBX5kcsZIfiOA6RW5JnHIqRugDSYO4aeYr64ChnIYHHld3xw
         OrqRWwx2OOcKvpFvw/jlVZL9CEo1szIRDFsr6KsDeGQPJVYEms6tgDHF5FrnKG0DKXop
         FsHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361723; x=1790966523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1PCN/eJ30EXDvqgIEVywdLTEtL09HO8pRJxVwe8r1Ec=;
        b=J4mPYDLLGnE9uQ0T9aObl44DmPjEjQcZ9j2RUOBjM2WRi6zwG0xI+JoDLIooAOqCGV
         evkU7ggPB5r0Bpndf4xqvyFVj9E6omxgLhZZPkW2slooTX4j0okmdZD9C2F2NgC1vCl6
         k86ys1Vl3Uxu8L7us1MbwsGNoyS6J87JdOGsfSek3Kh55j2iZdrdWno3igUO5MiX8O8p
         dR2WU38Cvx11QMsxg5hG8q1aBZqzTEJt5tBtGOgUGjhrXSCvTxhwFRBVCDZofhfRbZNF
         RxsSsK14g4kjEqRr85WWpRT0EUIiycESqWfFlXU5JXsjoZkj4QGtN6ErwBKI8vI0H5mQ
         FRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361723; x=1790966523;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1PCN/eJ30EXDvqgIEVywdLTEtL09HO8pRJxVwe8r1Ec=;
        b=b81+s3gmXoOJ1MsM7lIprPFjBMZCLYjkzO51ZLh+vTzI9JEcb3+1aPlUduwoGDj8fC
         vooZwu0B/dQXY8qsubrOAndvvdTblCuyxOQofL7znIAxN0egS7k9lwbK9MH0MakR7PMy
         TLkzVYUYUs674ibCY2f2KeIbFpNB6JfWtNjvupztB4qDhxlE+D4tdVHz7k8aomCUMBhV
         U4QSAIUSXh5aLNca5p220zYWkFvMCg0zi4/JfMBZobdpkA7MaUyMCKQKAvtd/Y2qIjpl
         hOJJo1OvC4suLe4R1iuH3As06w/oUVjtywk2tNZR6ZilXLVQ24qqL19/JdfbwRtRM/4g
         /0IA==
X-Forwarded-Encrypted: i=1; AKwUvBzQK5u6o70c1JP51wxbTYEU7g+HUkgDVmOQGnj77CF/gxX/IriBEPbVK5Ty5j+qkAXa60VUsaLWPYO9zA==@vger.kernel.org
X-Gm-Message-State: AFuF++lpEdoz1Uh4m1IE/mu5p8lg7IDMW9MOmzri8MO3MHBbyNuLYoIZ
	YB3J4hybLXg6JzMydEcsMvDn9ivOWIC66XTdX3prW6TlVecZKyETzmRSx9tifbbonx8IJW50bu/
	0RM184N0bV18Oce2LbrQa0hF4MAh6Pg==
X-Gm-Gg: AYBFou0kCkw7d3WC02bwhLz65rGIWlT2r/do5Z8OBBvWizJrT1HzBiYS3t+ZSinern5
	brzQsv2XhG8s0g8QZl5qzqfvlbVjl7dpj/1tyrcldJUEHM/8alKPEkexKyXy9g1Clgwg6PC7BZb
	ZUCY6bgo+lU8H+kPqYlX8OzYVfx8Sl8zObBwO2z0SzXuxYNdVqsazhYsK9ZtQvv+gokaN4cbth0
	qkhm4T/8ZMdp+VnuoCGo/myzI/otI0nIxBWEhPKGGKLUcMoDywjTyRFigIHfkLgGzBxGbf/G1DQ
	K8S4ZdmmyMQwZZml/OTdrfclcYpTRG+NcOBOfELOicd0NrycETNkRBcT6cVe/GbOS8jT42YfROu
	jo5jzCg0xILL17bcxn+OSknyYKtgqr29oiIStv4LvGydXFB5D2ldMC+JzK6VnZq18
X-Received: by 2002:a17:907:c609:10b0:c2a:f5c2:5cfb with SMTP id
 a640c23a62f3a-c2af5c26112mr141173866b.7.1790361723550; Fri, 25 Sep 2026
 11:42:03 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:42:02 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:41:33 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 25 Sep 2026 11:41:11 -0700
In-Reply-To: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
References: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 25 Sep 2026 18:42:02 +0000
X-Gm-Features: AclHuK93WCMThwzB62NGGPUhReh2HvWzHdMO2hPiVwHYNnR5LFZOQOgclwYoXI0
Message-ID: <CAGEsz8HdRUS+fiSq=Yp-ivN6_SiruegFc+V_AsmOxr=V+5rJpw@mail.gmail.com>
Subject: [PATCH v3 1/2] media: amphion: drain message work before releasing
 core state
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vpu_core_unregister() frees core->msg_buffer before cancelling the message
workers, although core->msg_fifo still uses the buffer as its backing
storage. A queued worker can read it after it has been freed.

Drain the core and instance message work first, then release core->vpu
and the FIFO buffer. This follows the ordering in vpu_core_suspend().

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c
b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..a0c58ec97a42 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,22 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }

+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);

-	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
-
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}

+	vpu_core_put_vpu(core);
+	core->vpu = NULL;
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+
 	return 0;
 }

-- 
2.53.0
