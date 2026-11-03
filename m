Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691635;
	b=1+SS+sOUGDmK3tUKgdtJ08S67ucHtmNqMuoA1XD5UIJZvTBAEKxrFFhTCU8WsfY4+F+4
	 yHq65MiI4joYiyFyJQVCsolXQGA9taJeDksS6EkdZjuCPRXsHzmso0CLiJwY+628q0FT3
	 XfoRU1VRe8mPqlIlSdlMmnv3VLmVLO9JQo/YdJNQaTiFoqkqikCdT8Dw1CBD0vrAkufo2
	 PBhozLA13OPUKDahSBH81g0hivhM1/j/FZnkoDjEh6wtZxZJMp0poYUgmBet++FI8mYlD
	 WE7Uf7AR1tD+lOXyqj42c2M7RNZxPNca3X77lavjYXlrrHFRyAWSUwr0AHC64weaEUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691635;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=D/9ayD2xdcQAIBiqlYccMuVgAc10D9NSwQgHkS6Ofkg=;
	b=Ih99YuB3G7fe35E4XNpyb7U1Ede8RDZLSnQUdm2PlxlZa/rWa2CCD4dQcMY5B4jmV6Oc
	 MwEEF2Tk1FETRk1LN5N0SebyCOgX5qzdNNJp60NDO+idV6sLBqQ9mHzBWHnon3K7+BrVf
	 kK9fPMEksnh7ezgwTwUZXvxhKZH3lsJd/eProxcUYZI1BiCrLQ7mRwpEjkLuf0vAZoc83
	 241myaSNgZ14E40UblfV+bEaU0/j5XSk857i6f19K1kNWjNhckx3jhNQnVvLrNlguEhHk
	 l2uQz4ogvEpMFbjpJLjfszCgRZcKDRDPFczSW8RxAA42JahPCtRcS5mJjsEr950MbDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kx7ubyGv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FF4606A33C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kx7ubyGv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D81F00A20;
	Tue,  3 Nov 2026 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691635;
	bh=D/9ayD2xdcQAIBiqlYccMuVgAc10D9NSwQgHkS6Ofkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kx7ubyGvQvIkeRhmm84Mr7+1eAwR6aMhL7pOdlwTCUvy7T8y3PPgnBpTXCME9cDHf
	 lOL4jj/6eY+KuS0p/TbRy1GbBQ6DKpJqbrzXzMDr4BymoXxMnf4pzmEcXu2mO2R8fh
	 x/gJpkpULXZLS0izPirJwZBcxl/Bx21XUn9/M29HVtgr6PI5EvNTCZZyvNZcS94c8V
	 /Chy/5ESs+CD109WLOBjIGktr5NlrCS7EC/XVdsRGorf+DujtlQNfkDMSUZQu9f50T
	 f4Ml3RDVOYF8fOY5HdoeSRDEVwhZaFQAZMWRtlKlSU8Oalwk4Oktf88Hy8il2jznS/
	 qhi1JOlSKWTxg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 08/13] Documentation: media: document EDID_PRESENT cap and flag.
Date: Tue,  3 Nov 2026 08:31:59 +0100
Message-ID: <15ac30e0ab50507dec1dffd0e189887b8b9f5b09.1793691124.git.hverkuil+cisco@kernel.org>
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

Document CEC_CAP_HAS_EDID_PRESENT and CEC_LOG_ADDRS_FL_EDID_PRESENT.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../userspace-api/media/cec/cec-ioc-adap-g-caps.rst      | 9 +++++++++
 .../userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index 1d5248979a6d..abd62ac64541 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -143,6 +143,15 @@ returns the information to the application. The ioctl never fails.
       - 0x00000200
       - If this capability is set, then
         :ref:`CEC_MSG_FL_REPLY_VENDOR_ID <cec-msg-flags>` can be used.
+    * .. _`CEC-CAP-HAS-EDID-PRESENT`:
+
+      - ``CEC_CAP_HAS_EDID_PRESENT``
+      - 0x00000400
+      - If this capability is set, then
+        :ref:`CEC_LOG_ADDRS_FL_EDID_PRESENT <cec-log-addrs-flags>` is valid.
+	This makes it possible to tell apart the case where the Physical Address
+	is f.f.f.f because no EDID is present, and the case where it is f.f.f.f
+	because the EDID does not provide a valid Physical Address.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
index 8397bf573798..2088793b1506 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-log-addrs.rst
@@ -192,6 +192,15 @@ logical address types are already defined will return with error ``EBUSY``.
       - If this flag is set, then the CEC device failed to claim a free logical
         address and is in the unconfigured state. This can never happen if
 	``CEC_LOG_ADDRS_FL_ALLOW_UNREG_FALLBACK`` was set as well.
+    * .. _`CEC-LOG-ADDRS-FL-EDID-PRESENT`:
+
+      - ``CEC_LOG_ADDRS_FL_EDID_PRESENT``
+      - 16
+      - If this flag is set, then an EDID is present. This helps tell apart the
+        case where the Physical Address is f.f.f.f because no EDID is present,
+	and the case where it is f.f.f.f because the EDID does not provide a
+	valid Physical Address. This flag can only be used if
+	``CEC_CAP_HAS_EDID_PRESENT`` is set in the adapter capabilities.
 
 .. tabularcolumns:: |p{7.8cm}|p{1.0cm}|p{8.5cm}|
 
-- 
2.53.0

