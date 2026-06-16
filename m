Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E32466B57
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626946; cv=none; b=ZuGRQq2GwetffklL53wAnTBhFvIBhqUhszV3MRzUfvexP7GTQ3JKSQiBUqeYnB9l8Ofz100tG4jBedeGTvudWv8Fn4MRRDuZUdoawUptfGl52fhDtnG2J1301et6BWjwRiEooSt9txpoj/ck0IgtGPNO1eSk/2EirBB0B63SEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626946; c=relaxed/simple;
	bh=41zPCEol0eUufpMQ9H4c98v89lecisBNOafqo2EcZA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIPT6VAUUs9ROEwavrnTBO2283n3HmJb480/8tZ8iUmWP0ECK+3pDrkMhrM3CkJOJtD4P4U/A7inZAfs5taRHl5u6iKea1OXgRsXwn8tyv2X6g03KGjSQcbtCLLONbcfqLZCM7cvvvMxHdO8GDNZp6ybMWR+dVpvSPhWetA3Eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6rsdRmj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6rsdRmj"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36b9033d230so29947a91.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781626943; x=1782231743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66s/Cqlsk2WljPV0p2lHq/M1AWz2z3pkZtLVHbifA+k=;
        b=U6rsdRmjVYvJ4CVnUtoFaZVesed9H0tlWtGehxNn2I32utjmWkqlaSOLtQq/G9JkPK
         M1S+k7MqpPVEs1oMPo4GvutScCfBSlIaa+GA1Y1Z00LpQXrnxuWoN2W2GeICyAQZL4p1
         R0iFJEPPDbRA+p32vDdnDkl1I+e8BP/1dghcUdyc+mwhWdQLOBcO8ksKqWk0LOITXzo4
         ZwqhzyYKgvVxcRfW95lVeRaBPJK7uz+AHk13pLgrhb5EcJlN+U86Qsv+HMNYWU8xccNF
         4/fcHAXA8maxtUUkNFtjxchD8wKFS+RhNttxGJmIhuxuyhRrIqCFy/dYa9Fb+czoWJcz
         4jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626943; x=1782231743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=66s/Cqlsk2WljPV0p2lHq/M1AWz2z3pkZtLVHbifA+k=;
        b=dAKQ6iiDumeNHpZwsGYMvuvZbbHKZZXE24dGhBdKXOav12KLo/nnvaxGiCJHJL2RlN
         aqLl3ftxVul8HTy3OKcJ31vaNgZCqvGMpe5kbZsIkR0fvIDm36vhWAit5bzADD3OK/Ke
         AGRf77MZNX3VBjaBpvZ30KuWeL/7yLq19+7oZxLr4ADFoAtPdnqqQuhfNhEOcdSZpkqS
         PBFMwb22yaGG4ligejuOWyY71zJ/m5dSR5LJzklS3E6+NveJ5z663J7tgk8zBH+JdhBG
         ZnBypCM+R68YkrimGoKhSP9eUAuFiYoyPVxU6UtmsZ7rqEzbKq4jnQVG8TlecbwltZ7r
         iZ/A==
X-Forwarded-Encrypted: i=1; AFNElJ/pHd6PuaHGu0ibVUfVP044N9L3xySuTbubNlAywAahwGcS35Cs3bQ3bFaYTMld+UW/mW457TeRXhSHxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSw0IegxQQGwBfTOkP+GVgO8+xTpzQRY5F9vriYkJwwjUo2hfe
	1IUfhjOzPoCtJPSmJUuVal7rjzJ0aQ2ecrD7fZQBOaMX3meXq22T/JEe
X-Gm-Gg: Acq92OEVBgzRbJlazjBYysWI1SQ28ABlIti9+fiu98Ly8gvJn1AXBdY+4AuckQMfIDJ
	0eOr9OYCHYpz9DK1bMmHVA7eAuVI5WDU5rtI9erws4dZmWekFxz5KpC/maLBC+5LdozrrqVd67c
	hFSFA7GRIfUA7UYME7+hMOjtub+qlW21OGcYnwb+YlgxIMapQcZJiZPx2c8l/cTyXA9pN5XHmEu
	KBxwaAYhQuW00rlpTeJboL3g4NgU+g1Toz+RFKdOilZg3TbNDNcF0TyjRUdLGOFOIct5t7AkiG5
	svnXb97AiJp0QnDDZ3ShLBegwkAAASVb9MuWU8Xqr8aioBiQaYLDhgC92UIgCZsSogftIqNO8u1
	6vmGQsJzgDZ/+VnF1xq5fWhsF6T+ZMeg7tkeZmC9e+wO0KdPMIvpDXeRRv8qEBADBcPBJRPe68+
	5o2UGlR2LK46y91H1MTv2GR7pN6fH8yXV8SdzliVWN4+I83xeYb27U
X-Received: by 2002:a17:90b:4f92:b0:370:aa94:1662 with SMTP id 98e67ed59e1d1-37c8e5a9d5fmr220652a91.9.1781626943607;
        Tue, 16 Jun 2026 09:22:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521e76d1sm3360775a91.8.2026.06.16.09.22.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 09:22:23 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	tomi.valkeinen+renesas@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2] media: v4l2-core: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 21:52:09 +0530
Message-ID: <20260616162208.56488-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616092516.46339-1-birenpandya@gmail.com>
References: <20260616092516.46339-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify v4l2_subdev_get_fwnode_pad_1_to_1() by converting the local
fwnode variable to use the __free(fwnode_handle) scope-based cleanup
macro.

This removes the need for manual fwnode_handle_put() calls and naturally
ensures the fwnode reference is held during the device_match_fwnode()
comparison.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v2:
- Updated the commit message to remove the "Use-After-Free" language,
  as there is no vulnerability in practice.
- Adjusted the implementation to declare `struct fwnode_handle *fwnode`
  directly at the point of initialization, rather than at the top of the
  block, conforming to recommended usage.
- Renamed the patch subject to better reflect the true nature of the change.
- Link to v1: https://lore.kernel.org/all/20260616092516.46339-1-birenpandya@gmail.com/

 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e6b133ef7850..806b059410ce 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1243,15 +1243,14 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 				      struct fwnode_endpoint *endpoint)
 {
-	struct fwnode_handle *fwnode;
+	struct fwnode_handle *fwnode __free(fwnode_handle) =
+		fwnode_graph_get_port_parent(endpoint->local_fwnode);
 	struct v4l2_subdev *sd;
 
 	if (!is_media_entity_v4l2_subdev(entity))
 		return -EINVAL;
 
 	sd = media_entity_to_v4l2_subdev(entity);
 
-	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
-	fwnode_handle_put(fwnode);
 
 	if (device_match_fwnode(sd->dev, fwnode))
 		return endpoint->port;
 
-- 
2.50.1 (Apple Git-155)

