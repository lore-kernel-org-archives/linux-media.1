Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863652;
	b=gIGVppBjmDiPh2vBi4/hSSDNT4TxxMdEvcf3N8i74PkAPbaAsB6ZgrjIAri8ZiLACGRb
	 uUVUiM54Omc8Ej9x1k3OA7ssQcPI00nBgVqunqFmsvKDpyfItFQpjvhSZlyUc0J7qGsWa
	 GMsRoZ+KyYgu7SOBCcJY4akQNMf61biZrFBX55HoQZsfN1VUUvigjtl9Iu9+kEdD5Vl8u
	 srPqGeZrkJP0vrPLO9T1a7M55OeEyTAk6i8cxlwlq69Hhpcm0U3UkTgJUhszn5a0Bpbsl
	 RXi+dwx4Lqdj4FbexpfYNFZm/4w9reK9c0qS9P4eEWfEinWDvuATxL5Pum4ujRCS4xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863652;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=49UoCEgpyuiXuX8KYfBHZ1O0/bic+sOLxNbkV9ycThE=;
	b=IpfByiAtogT5HedTyCSDgG0/Wkx2E78sXxJAyJFh5hnLAKGxy7raL35smFd7xcYmtPEu
	 B6jbTu5SeGNkWhFgrFiRwYr7LiB0HpUZ6cykO4y+DWOunEmeIojtN/kTeIh2CDTr7I8F6
	 9dnjoit1gFL4Nud59uQ5vkOUTLytMEI1n6col7nT1GiNoj6j5TLoF12gMl36BwDKyCNN3
	 O7JC2yqREvRjKGNPSZMmuLUVMxYjinHtc0Qd6vpRg5hUnl9KHrHpXh97eColAp6R/klaV
	 JkOo7RZUnlRu6I16hNmHPadT675kSLrF1Z2L0VDNADPEFnNvL3tgJMa/0kVM/25QP0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LR0ToNkz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB215606A32D
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LR0ToNkz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C4F1F00919;
	Thu,  5 Nov 2026 07:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863651;
	bh=49UoCEgpyuiXuX8KYfBHZ1O0/bic+sOLxNbkV9ycThE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LR0ToNkz/JgixFo0/E0CGtD3UAjSoVB+nV3N5AADExp6GdGnRDXPduP0oDB8BOqmO
	 O0xlYyf4ZV4ys8zJ1bmhPj8Th1q6n5USN18l6PM+xoSYl6qYQhNMmfBqyBTxY9gkHT
	 WDZDG9xKYrZOwUuWTvoR3T6zguztzKRGR7HbeGmLNVTCbUNcZ5pgqhQGC3P1qdIxb1
	 D3ydtOJW1igsMkMQJ20snLifCb35VijPAxHqus06FTlIoXHwVrTzL86rMIvibYJc0C
	 jOqhDZ8pxww6/ABDYs7/RnvWqUErqKLE9FHKtqhPZUTlFIJ+dtF1Fjn0mY9EEcNDG1
	 +iyJ8u+OqutpA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 11/13] Documentation: media: cec-ioc-dqevent.rst: document STATE_HPD_PRESENT flag
Date: Thu,  5 Nov 2026 08:22:25 +0100
Message-ID: <ecdc175d624bb4b5ba7742ad112d3abcd04dcb1d.1793863347.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793863347.git.hverkuil+cisco@kernel.org>
References: <cover.1793863347.git.hverkuil+cisco@kernel.org>
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

Document the CEC_EVENT_FL_STATE_HPD_PRESENT event flag.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../userspace-api/media/cec/cec-ioc-adap-g-caps.rst    |  3 ++-
 .../userspace-api/media/cec/cec-ioc-dqevent.rst        | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index bf734cbee0dd..0afb0e11fd72 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -148,7 +148,8 @@ returns the information to the application. The ioctl never fails.
       - ``CEC_CAP_HAS_HPD_PRESENT``
       - 0x00000400
       - If this capability is set, then
-        :ref:`CEC_LOG_ADDRS_FL_HPD_PRESENT <cec-log-addrs-flags>` is valid.
+        :ref:`CEC_LOG_ADDRS_FL_HPD_PRESENT <cec-log-addrs-flags>` and
+        :ref:`CEC_EVENT_FL_STATE_HPD_PRESENT <cec-event-flags>` are valid.
 	This makes it possible to tell apart the case where the Physical Address
 	is f.f.f.f because no HPD (Hotplug Detect) is present, and the case
 	where it is f.f.f.f because the EDID does not provide a valid Physical
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
index 71d6a9e81f75..b399c5f1b847 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
@@ -224,6 +224,16 @@ it is guaranteed that the state did change in between the two events.
       - 2
       - Set if one or more events of the given event type have been dropped.
         This is an indication that the application cannot keep up.
+    * .. _`CEC-EVENT-FL-STATE-HPD-PRESENT`:
+
+      - ``CEC_EVENT_FL_STATE_HPD_PRESENT``
+      - 4
+      - Only set for the ``CEC_EVENT_STATE_CHANGE`` event type.
+        If this flag is set, then an HPD is present. This helps tell apart the
+        case where the Physical Address is f.f.f.f because no HPD (Hotplug
+        Detect) is present, and the case where it is f.f.f.f because the EDID
+        does not provide a valid Physical Address. This flag can only be used
+        if ``CEC_CAP_HAS_HPD_PRESENT`` is set in the adapter capabilities.
 
 
 Return Value
-- 
2.53.0

