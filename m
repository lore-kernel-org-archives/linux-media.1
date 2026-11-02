Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616909;
	b=iokIPxIOJJeukfEEfQakD3NG+87h/yvjrzgQNFoOWnf70PvIN5vIItL1598WluBlmUxC
	 I+3mhMP0MKzaBDd+5AwpQOodQT07nHDNoYmQd50iGQ3UIJVJ3jrE3BPd6p/SSWlIUKZLG
	 NKU0QaYehJC7/i0RwT1FAGed2suVsRR3zY1hfZ8oA0F6G2/m36hVT7+v23z1LBMONaTOH
	 ztWaxeZfeNABQsZBRXFFlvBuD2rbewdlfyUT090s8FIJmUAXCjBjAg84TG+aGcFUpwNAs
	 BM/tFkjUnZOh1u9HtbNR5Cgp8kiZgs0nz4XqRqKedK1uxoBJVzw8FZZ/g8f29O61sig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616909;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=D/9ayD2xdcQAIBiqlYccMuVgAc10D9NSwQgHkS6Ofkg=;
	b=eY2TJhK3hgkLmn43UlL8X3mNJ5kIFa0M2M40VDP5T7A+dCJHERonzkLH0RCKVVuYh5MJ
	 qNsXN5K2e/xXJecbvzs0aM+SO1YqQVRN2HqCBENZdqkf1J/7BSUZqM7R+lNc2MVIFjtkC
	 3wWbyDh1hxmuiVuPur2rpx8De6RHj+XL++29fSK/l7owzHTzZ8KVff+vcWiD24GUqSJeg
	 f7gj9wXLWPp/ssm8zfTfox87MqG997Am6yKU9rL3dZyg9zBx4p34GK7d/A4qoHW3tKCxl
	 MQiqig102oYi/Ol2ZEZdA3jX6K6nN1ExJ3ytuK/+AxYbCJapR60B8MItahLwL03RK5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JbD56G/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D1606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JbD56G/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE741F00A1A;
	Mon,  2 Nov 2026 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616908;
	bh=D/9ayD2xdcQAIBiqlYccMuVgAc10D9NSwQgHkS6Ofkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JbD56G/H4Guoh7RIGIERZ8C5yxpBQfZudXrKbz8wJo+heAx4WpnOM794uTKSJOI/P
	 lHC3069BtKIiQjboSmbbkUY4zOcAGIx7lKawqIe7llzEgtKpIp83r2BKA7VFdYkr7o
	 h+r5lzCdVBjjmYzgR1umyncQhOcQASAm1ImqYPFwBKJx5IXZkTBnvt0EIH86Itl33a
	 +4XCQCI09neEPwNu8sR46CY+mXBSEB6/Zh2td0aPtVbWetaOSVr6r3FNaENjOQO4pD
	 81P1lGy80NKi0B+0QWjMXz3h/RL+WjfPHeS+LczftN7Ava8rroRMHUtJ/3vd6OZT/d
	 bS6dPKyBom/ZQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 08/13] Documentation: media: document EDID_PRESENT cap and flag.
Date: Mon,  2 Nov 2026 11:36:59 +0100
Message-ID: <b89bc6d4f1ed1e758336a99f3606033448cef798.1793615824.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793615824.git.hverkuil+cisco@kernel.org>
References: <cover.1793615824.git.hverkuil+cisco@kernel.org>
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

