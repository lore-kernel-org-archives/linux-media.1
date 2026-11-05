Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863647;
	b=3VlXUH63RDcWY96pTIuTi9n6YrnhcI48Gwlo1p6vTPRbPcQxjMTmqRj8/QAV5IdtM5eR
	 4+iCH9ydsYA0/7A9xvkWoNZIfC2J2l4buhOSeQtRaVyHHmFx0kgAfzgzOMMxnx9o49hhQ
	 5HOpepwGCoFFz6NCTir7tdh0CP2pRj/dluCczPLtDQv99oRi7lpKn6v+i6V95uawFcWk8
	 V5qesTMBVkUKmXK/yIDd1i6Io0ZzzVUA2ik8g72hqTIg69V0L4Fw3S98a/npO2a78Ljtt
	 O8qCDCPJnWkAq1888K4eyTggDzeumo1BkPDJzn5BlrLsUgONHRmcQpslGzMl0NROn7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863647;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cJ+jyiHcrkuFKlcBlqPpHulH/buCVf33DuiMRw6GxEY=;
	b=bnNWiFGkWF33ZtAbEeHbjFZhwbGfJ3xg7QHh1mUyMyihxmaeNNsVD6rr64h57sk9kRiQ
	 rbUEldcw0/Zo62VG5oTRWgdG1WoEEI9MYO+dldIOpXgAxkfX8HrrMYnEPqNZXH2LUXFd+
	 6J47iNcqt5/KdAv/+yhIgpBa1pC7ZHlM1VP6tOBYii5af73SdxBCRhQ3qx6cbbAK7IEhx
	 tL1fhwsvOdTiuwcHFIOfUze/b7uqjUryiu2OBjGvelby3tBp/1leRpEc3Nzh7TmOtLxBf
	 Zrn5k9w5HlOqdqiQJL+nov2HhdAAjXIX0GEkNV7yf5GPw9a4XMRerC4oQCTcjVWTr8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Zq/vSxMb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0445606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zq/vSxMb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271FE1F000C1;
	Thu,  5 Nov 2026 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863646;
	bh=cJ+jyiHcrkuFKlcBlqPpHulH/buCVf33DuiMRw6GxEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zq/vSxMbHBQBXSIwnBd04Nw6Y4nK8LkwbGrlWmnvYvgQxL/ge1URqfMVAcMtJ+x+o
	 xOhDLTSoW7tpKpWzohoT+9cF7CaW9DWDBRyJMe3A5jbI5Nbpc+Oa0G69FUIrCnkHPH
	 mHBVaqCiPEJygCCIcL7EFfterSoloX2A1SI0XrvbIGn0hjuVImaZPEpgoIDw6vRQi+
	 HhjDqkUo1inUMUepqpmQqLolk/expJFQUmBQe5gzfOKZM6wxakH4sYhoX4h6GW1SMJ
	 EmTu4RnpE2ULVZLBYCAUNztL56E8eycBTQQGCAOTwiKJCCLSgWlB4M0V8jeFunZxNX
	 T9NytCNV402kw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 08/13] Documentation: media: document HPD_PRESENT cap and flag.
Date: Thu,  5 Nov 2026 08:22:22 +0100
Message-ID: <e98308c0db382c09ce698b34ca54f798ab0e3557.1793863347.git.hverkuil+cisco@kernel.org>
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

Document CEC_CAP_HAS_HPD_PRESENT and CEC_LOG_ADDRS_FL_HPD_PRESENT.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../userspace-api/media/cec/cec-ioc-adap-g-caps.rst    | 10 ++++++++++
 .../media/cec/cec-ioc-adap-g-log-addrs.rst             | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index 1d5248979a6d..bf734cbee0dd 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -143,6 +143,16 @@ returns the information to the application. The ioctl never fails.
       - 0x00000200
       - If this capability is set, then
         :ref:`CEC_MSG_FL_REPLY_VENDOR_ID <cec-msg-flags>` can be used.
+    * .. _`CEC-CAP-HAS-HPD-PRESENT`:
+
+      - ``CEC_CAP_HAS_HPD_PRESENT``
+      - 0x00000400
+      - If this capability is set, then
+        :ref:`CEC_LOG_ADDRS_FL_HPD_PRESENT <cec-log-addrs-flags>` is valid.
+	This makes it possible to tell apart the case where the Physical Address
+	is f.f.f.f because no HPD (Hotplug Detect) is present, and the case
+	where it is f.f.f.f because the EDID does not provide a valid Physical
+	Address.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
index 8397bf573798..e37898750ab5 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -192,6 +192,16 @@ logical address types are already defined will return with error ``EBUSY``.
       - If this flag is set, then the CEC device failed to claim a free logical
         address and is in the unconfigured state. This can never happen if
 	``CEC_LOG_ADDRS_FL_ALLOW_UNREG_FALLBACK`` was set as well.
+    * .. _`CEC-LOG-ADDRS-FL-HPD-PRESENT`:
+
+      - ``CEC_LOG_ADDRS_FL_HPD_PRESENT``
+      - 16
+      - If this flag is set, then the HPD (Hotplug Detect) is present. This
+	 helps tell apart the case where the Physical Address is f.f.f.f
+	 because no HPD is present, and the case where it is f.f.f.f because the
+	 EDID does not provide a valid Physical Address. This flag can only be
+	 used if ``CEC_CAP_HAS_HPD_PRESENT`` is set in the adapter
+	 capabilities.
 
 .. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.5cm}|
 
-- 
2.53.0

