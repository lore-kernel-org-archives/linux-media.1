Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691641;
	b=qdKQVHulxYjpvbwJSfeHW8YmYqNNBew+s7Ws1fRMa8JkYmxtWHUcl0Lob8996G1pLIlk
	 i1/tu/tmdluSD6rcx/35rr5AZRN4oJL1YT6vSXEKbI8LUEfhF4LQa+34TIBWu1jqFWyOq
	 Z611BJ5xVAGdL1nR9bmoB53PA9WNEcZVVLFTQkTkRuq7Tkc5gNfdquY76OM5OCHdnHL1p
	 /ejWVp9RVk+p/5hn4r3ufL535w/J7i1iyJtg8J/a1cP66cnOIdan8LzJy+8QjFEN2id+H
	 JmPe8u65GSFgA9JvCpjRN6BHqnMaECZaFdMhbYIf9oMN2QRmucWxxWEVanCPItOSPgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691641;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bCHawQ0yxotQhJh8sLEUiGEitartFjFESIjtqLTPRqw=;
	b=siFQC0JZYBZ9wYK+gWzvK+1dpCdTrmIth34WSoXK9jzTnrE9CSnlls7Z/lFXFjPuJ8Fz
	 GO2jteRNG5vaPlPjdQH4JGqZhgTmCvZlxcCqlW1xumEt9JTjpuDCFG7UwVb5+PV6+QdmK
	 NVpdRXUs+bR/9Hr5IKD1l/06F6ALNvsF7uOV7pn5wkH2WQCdvg7YFkzyTk+6HaLKq3XZa
	 AJzsRjVBqPVxbqXEEe13qSIVGOWWIayU7jlZ29sPRQfwWh9u3/jtyGNcVaiiUlE1FbmkU
	 uGa+uYP5x0w9IpjEogR7CUqgYXsvJSeCu43FfuqZ7c0A4eMOxi1MZ6W8We3FzDDaVjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWPGO3Jr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B60606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWPGO3Jr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229811F00A1C;
	Tue,  3 Nov 2026 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691641;
	bh=bCHawQ0yxotQhJh8sLEUiGEitartFjFESIjtqLTPRqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fWPGO3Jr0ph/dR1+K4E02hCGcIe98I4wKnQ7Afd6ZnpmTeZdqzFJfLUbrwh6oExQn
	 SIjDbJf3Exhx9isQ0Zcxo6pRyRwNq3MKaH5pquFG6jXhwA/6gjrcwhqsx/HWQ/Sc29
	 1ZYngdHY6zVautPTfkDktcmNer1oc01WY4GX5P5FheLIhZFUlBsLgBdNf8egeVfAPZ
	 ryfrxMhs4fx2p78hrx7rJfCibZ68h2FxZPL+8aiV3h+DGJ7MrCcU399/yE47q1Xd80
	 hJEM5v0fItz8N0lTWbIEaZdq+UKnyD5LOhuGeKTYJZKzKS4gKFRA5uaWQhjO57fx9w
	 Fi9gTMPAXWsEQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 12/13] media: cec: core: implement CEC_EVENT_FL_STATE_EDID_PRESENT
Date: Tue,  3 Nov 2026 08:32:03 +0100
Message-ID: <897c6071fbdca71dbb446b03e32c0e6af219ecf0.1793691124.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793691124.git.hverkuil+cisco@kernel.org>
References: <cover.1793691124.git.hverkuil+cisco@kernel.org>
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

Set CEC_EVENT_FL_STATE_EDID_PRESENT if needed when posting the state
change event.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c |  2 ++
 drivers/media/cec/core/cec-api.c  | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 1a7b79916e47..52a56cabedcf 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -323,6 +323,8 @@ static void cec_post_state_event(struct cec_adapter *adap)
 	ev.state_change.log_addr_mask = adap->log_addrs.log_addr_mask;
 	ev.state_change.have_conn_info =
 		adap->conn_info.type != CEC_CONNECTOR_TYPE_NO_CONNECTOR;
+	if (adap->log_addrs.flags & CEC_LOG_ADDRS_FL_EDID_PRESENT)
+		ev.flags |= CEC_EVENT_FL_STATE_EDID_PRESENT;
 	cec_queue_event(adap, &ev);
 }
 
diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index 1ba080d5a123..77778ff737a6 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -560,10 +560,7 @@ static int cec_open(struct inode *inode, struct file *filp)
 	 * Initial events that are automatically sent when the cec device is
 	 * opened.
 	 */
-	struct cec_event ev = {
-		.event = CEC_EVENT_STATE_CHANGE,
-		.flags = CEC_EVENT_FL_INITIAL_STATE,
-	};
+	struct cec_event ev = {};
 	unsigned int i;
 	int err;
 
@@ -589,12 +586,17 @@ static int cec_open(struct inode *inode, struct file *filp)
 	filp->private_data = fh;
 
 	/* Queue up initial state events */
+	ev.event = CEC_EVENT_STATE_CHANGE;
 	ev.state_change.phys_addr = adap->phys_addr;
 	ev.state_change.log_addr_mask = adap->log_addrs.log_addr_mask;
 	ev.state_change.have_conn_info =
 		adap->conn_info.type != CEC_CONNECTOR_TYPE_NO_CONNECTOR;
+	ev.flags = CEC_EVENT_FL_INITIAL_STATE;
+	if (adap->log_addrs.flags & CEC_LOG_ADDRS_FL_EDID_PRESENT)
+		ev.flags |= CEC_EVENT_FL_STATE_EDID_PRESENT;
 	cec_queue_event_fh(fh, &ev, 0);
 #ifdef CONFIG_CEC_PIN
+	ev.flags = CEC_EVENT_FL_INITIAL_STATE;
 	if (adap->pin && adap->pin->ops->read_hpd &&
 	    !adap->devnode.unregistered) {
 		err = adap->pin->ops->read_hpd(adap);
-- 
2.53.0

