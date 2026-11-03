Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691638;
	b=XXLh5+i+9fPdkrLiBlbl3zRX/rPlxtTctXD1QYk05oj21m7ruOHa4OLDTwwpqbJGTjb/
	 XcKiKZEmpVw/xOMGrtK/j5jJ9Umg89zjPAAYP6FO/OfYmeCdo6o0GnvMdAm72wYwVxEpn
	 fqWBAn04dCHGLT1LTcsqocHiaRO/he9BrKRGAS5u/KVy0tggxcS8MxFS3XOFiXvyKQzxP
	 Se7jwWt95EKewiDxlx+dWNk96Rx4vtnfLEnppP3WUNAsgw8Rjko3EwbSs9TR2x0xLGise
	 cZ7TZtXghOd/sYzl9D28G3BPM8p3dTDsbe/AfHG/HBG+Pvwf/NmfmD9VZrdQ1BvCqDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691638;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rabuf4op/XN5NP6YCfyGe/a7zJ5w3jeN4Y6eXAm5e00=;
	b=mLdkaFlzFQ6dPMFDD7Q4K9kh4Vav0W3QRzULwi7o8/m+pe0D7A9w7zqi5OKkhMD0w+E6
	 6FRMNO8vMsPxM5kx+T3ozhQAGXT1b+i4WexH298/kOC5TIbrZk7qQ5tSbTBxdhOqCpIhk
	 p6B+yBlllkrgjScRli1qwkres8eLzRTiMQekcXsw6+LNGnQCohAaXfiWWk4uGFgz8FQiu
	 08SRWEjRvEImj0kKAEfIryrPfoz+4tPLImg4cCj5cdYx8k0QuCSYi4u2wHiZ16OZRx0Ay
	 hNqz/fIHa1non7AxXYg0P+sm7CTdmZfQSOz+IymQl3eKsrcJZbLTTeUge1rTzIQRRrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VBAEV328;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95696606D808
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VBAEV328
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130571F00919;
	Tue,  3 Nov 2026 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793691638;
	bh=Rabuf4op/XN5NP6YCfyGe/a7zJ5w3jeN4Y6eXAm5e00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VBAEV3282+sZdY2DagnFYdB0oW4fOavxYu5Ke68Lc+DqHiPFhZkcAwAcm7M6zQxcB
	 CS+pn8paSOakv3GMSxphVlvKEgxJM6ApSNu/w8fWtsBbgYSBVcxnC/pAioUumwaJsV
	 OyPkADf/yU4QXsgaKo6/Xmc1cG+oqKw36xXSJUqG0/d9pqFRkJDb3yAAQRl/ZlkpRz
	 wBBciqGmnksAFd4bMfMEJgBIwy+2cBm2encUeIeo/8M8waVyLeYrO528Sh+k4aJjlt
	 2tNWP+GQAwcAA/j8U9bvmnAjpJhEpFuMx8FLIqvCGT9QnpPFi1/MUsoSezX4/xCyzy
	 xLz9Ric/He58w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 10/13] media: uapi: cec.h: add CEC_EVENT_FL_STATE_EDID_PRESENT flag
Date: Tue,  3 Nov 2026 08:32:01 +0100
Message-ID: <215493fe7ce132b19dc109f0fa83d3bd2c081d2b.1793691124.git.hverkuil+cisco@kernel.org>
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

The CEC_EVENT_FL_STATE_EDID_PRESENT will report whether the EDID is
present or not.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 8f7c7a4cb505..8324d208c1d5 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -455,6 +455,7 @@ struct cec_connector_info {
 
 #define CEC_EVENT_FL_INITIAL_STATE	(1 << 0)
 #define CEC_EVENT_FL_DROPPED_EVENTS	(1 << 1)
+#define CEC_EVENT_FL_STATE_EDID_PRESENT	(1 << 2)
 
 /**
  * struct cec_event_state_change - used when the CEC adapter changes state.
-- 
2.53.0

