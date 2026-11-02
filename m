Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616914;
	b=iVcBgL+n2RInH6bja+QQ2+ML+nSGazC5nY3N8Y8vIYnoC8P9F7E4nqfsBwCTmbylUHt4
	 x+D44Bx8fVKArWFu0GNGsa3IBd4x/Vq3k2ANyCKLD5xHHIQd01jDxCJTHlIK1RtSk/cgg
	 4tm4wv7fky2e62yKF7wQZXwAKYNYVFL2WBcSK2KHMkh1DKVgzeqy+1lCpssOTI38Uwt9N
	 7nVX5DPxWFGrBVkzYk6aQoi6ZiQzMBa/dMja2STSvsYncTQwFbt7/WF/MnU78GqbrjGiz
	 7zRLzwneVrfV2SevccU4ZHO6ZBQHPYAs/Redx2tzWOqGmDas41zMwnMYtxLXbWbTCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616914;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qdx2BkWqosqnUNeKXOVUifF3kLiaRnwfjemg//knEvA=;
	b=n+6ZnTElMokCn7FSuBx9ZjFDvPJaOmafLVS7H5SG37zMFU89igR5qcN/zR97IdoWnZjP
	 AOJz3V212Ln2XjsvfGr1RGfsQrG8u9WQqDbif0DCk8RytTbecndUoIAy21erGSsYRCvb/
	 mH2Pqh+4IrVlIPdmnmKtgzIZlWnz4RYxZuQNKuBn/Lc2W9U5+tA8A0jG+fYqoNp2/PfUz
	 kz7rQ8W2/K0T0rUDXEApa/v9DdLIjhtebsbcFVoSMPNfw3jkkPA1uCqiKP+RNqVMoLFXN
	 Is2gxkX3oeRDBj9C8dUryzWXhmuPjk+mHzXSd9i8ABEN5NiYsLl7tXV+g/IMs4/EoAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZhF5vGD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1710606A329
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZhF5vGD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6491F00A16;
	Mon,  2 Nov 2026 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616913;
	bh=qdx2BkWqosqnUNeKXOVUifF3kLiaRnwfjemg//knEvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bZhF5vGDapMSBHsz5k6SKiMsGhe0lcXQ1hELK/IwrcVUlWcSjNVsgF3GBYeL7L1iq
	 fGmx9wzLq8I3Pj4kYjaGEHz+7esVAPTjT/gURuU5ofU7padQE/oL44OdPE9RU+x9iY
	 eQ/RPCN4gsJvgaBB96YEWYKC+ojvn4XlszifKbLT69mNtJ1lEDEHdW7zA5L51yahRV
	 ZlOOnFsvUrmy+yfsFZelOnrvAXgj65cX4F/0pjk3ycylJNS70QRTy1wbRnCr4EjayJ
	 3vPi3ma/Jb+ykWLpXHD1BuaIMXcsjPABNlzwzCcaTBIUxrI3ayAMIDY5uShUdbCusH
	 LG69+hr1Y4+rA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 11/13] Documentation: media: cec-ioc-dqevent.rst: document STATE_EDID_PRESENT flag
Date: Mon,  2 Nov 2026 11:37:02 +0100
Message-ID: <f4e77dea0774b109d775bf3d12d25cff74d6843e.1793615824.git.hverkuil+cisco@kernel.org>
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

