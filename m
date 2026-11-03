Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691640;
	b=AVyCsxtWj6wU0Q/YMQ/TpL8nbPyp9SBJzLClmU9wiYrhe82+NT56k59716s7QvNIbje7
	 CS0oNW88NYNq3hFJBsKUNGLShXw9Jm68Z1TnykUst9XZiDFH5JSBolbnfJninlhkaARmG
	 mkjyW8/2qzuiKiI/SF9wliVRwFJIdiKkUvzJnrJojau8mV8TaxR0oyqv5CzBMmNGdD23s
	 KW+CNJXf3ZHck3+UzWFn57lpSfWswNA1WYlip5kbDxrKC3PC8nOvpjGd+5iYtoLHcuxhc
	 7A1HBcF0A5yJHVKIv+U4zuUhLB+JuZZ7BOA+ElS8PM0Q1UQNAVtbxqTi9gfm3VdJaiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691640;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qdx2BkWqosqnUNeKXOVUifF3kLiaRnwfjemg//knEvA=;
	b=BqG8uAqF3Pr6BOt0OwyI9OUW4KisUPGuRsQqoAi1DF8rLPtqI898QF8aeGMJ/BuuswS4
	 STL4T9gwsn8KJsjkK2rgN3G0wf2n0kIIuYvF00omocKNjDBl7QgTFpY0k8avLkHld+KYR
	 JsgbssE50QQ5D6lGIT6vCUwKS5a+gmeLakF0r1/dYJAn9cZoK3h+KtvnMk+OhC8HYHWXJ
	 jWBv39YHfcF7eUbV2PTKq02Lr5TgCRyOhP1ZZg3/hQYV7uzDjSq8JBrLxibdF/ikmaITQ
	 UNGC2I5P8ouoGbraKzDT6PlNMIk9RxWXZAgpjEIT4skXtm3zgWXcMlkiVmufYfMEwtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPTkD4Ja;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F075606A339
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPTkD4Ja
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3421F01577;
	Tue,  3 Nov 2026 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691639;
	bh=qdx2BkWqosqnUNeKXOVUifF3kLiaRnwfjemg//knEvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PPTkD4Ja/PRJDdfyafN9V/67F9tcKBP2U3+V4R4O7RXIQs5NZp3AkfldxQcuDqBe5
	 RAnUgi96Z7cj0ZQllZTUxv4MDeup0/PsLTHNjAFFLMHZD3yRtabcC5zBxQekSSbP2Q
	 I8n4AnIaUc5rcjmOuiAvSjXXHLFAg3W3TULhHe9ykodYSAyBFHDFDsjXpIN5sPIfXH
	 Uy8T577Do6GOa7mVAg9TFRp7qJOVR9wliV8f3b4m7XY0Qp8YvKXn38HESJ0bEM+19o
	 KnsjnDPybM2cF+yzMWfBurAt7m7A0kYi6fM4Xm146JfyI7yDlOq2jb05MPB4H7QQVl
	 Uui3XSQRIxGqA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 11/13] Documentation: media: cec-ioc-dqevent.rst: document STATE_EDID_PRESENT flag
Date: Tue,  3 Nov 2026 08:32:02 +0100
Message-ID: <03aefa129e683778cc461142891bcc8eab72a0ff.1793691124.git.hverkuil+cisco@kernel.org>
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

Document the CEC_EVENT_FL_STATE_EDID_PRESENT event flag.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../userspace-api/media/cec/cec-ioc-adap-g-caps.rst    |  3 ++-
 .../userspace-api/media/cec/cec-ioc-dqevent.rst        | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index abd62ac64541..49bd90d9392f 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -148,7 +148,8 @@ returns the information to the application. The ioctl never fails.
       - ``CEC_CAP_HAS_EDID_PRESENT``
       - 0x00000400
       - If this capability is set, then
-        :ref:`CEC_LOG_ADDRS_FL_EDID_PRESENT <cec-log-addrs-flags>` is valid.
+        :ref:`CEC_LOG_ADDRS_FL_EDID_PRESENT <cec-log-addrs-flags>` and
+        :ref:`CEC_EVENT_FL_STATE_EDID_PRESENT <cec-event-flags>` are valid.
 	This makes it possible to tell apart the case where the Physical Address
 	is f.f.f.f because no EDID is present, and the case where it is f.f.f.f
 	because the EDID does not provide a valid Physical Address.
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
index 71d6a9e81f75..188600dff3c7 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-dqevent.rst
@@ -224,6 +224,16 @@ it is guaranteed that the state did change in between the two events.
       - 2
       - Set if one or more events of the given event type have been dropped.
         This is an indication that the application cannot keep up.
+    * .. _`CEC-EVENT-FL-STATE-EDID-PRESENT`:
+
+      - ``CEC_EVENT_FL_STATE_EDID_PRESENT``
+      - 4
+      - Only set for the ``CEC_EVENT_STATE_CHANGE`` event type.
+        If this flag is set, then an EDID is present. This helps tell apart the
+        case where the Physical Address is f.f.f.f because no EDID is present,
+        and the case where it is f.f.f.f because the EDID does not provide a
+        valid Physical Address. This flag can only be used if
+        ``CEC_CAP_HAS_EDID_PRESENT`` is set in the adapter capabilities.
 
 
 Return Value
-- 
2.53.0

