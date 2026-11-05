Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863650;
	b=Ckt3top5Ss5Jqe3h5FrcrWlRhO9hE8LIuvnZpLPNtf0F7UIUNe0MTIU8O3/Nie51tiRj
	 mgSLJ2DNd7Kr99WRz+22nmz7ISnujmZMTRksKVF6XsrA1zsAhjKLKFi+uHMJx3ZiIs7Ra
	 1B+Q3OaO83e19F6p4Btb/JPVInfwp+5pUe1DTwgnb6nTla4AlyuyWLR/Mct37CqO78O9p
	 lX/h+NCZicZTFf8LLshQAb5x7sd+JWRG3kadwfCu5zNpmZcI22bVNmaYD0nV7EDJU4Icx
	 ZZtj2Z6oEr5layFZwOtF31k5NMss22GglSk4ytThhffxOOOvlNuKaZqLc29ZeX9qzpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863650;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kadFEy+/72y6ZOpa2TS32E9qFJbHaf1fMrcltpT+OOo=;
	b=plhLoUD91xAdt6tMvvbbWZZJccrauW3Nzju7tDUMyNEZas1JSmBmzN6+AwH23ZOt6Gsm
	 sfDry0X3X5ExOjO4uYiEn1gbNzlTG2d5+yUYEEMyK2ONXeafEecjbA1olz90/4r5W5Q0p
	 c7rjpVj3RX2UCeP7drPpEeHRl8+SHNfiKiJDNOa/cHQxJFW53C1dQrvjHCv+O82AzHJ5J
	 arnO1tVqacbdnp62hNMDsdd/rPiYDlANekWOsVIRnL+5yKzp39f2EDGpA3UQ/qy1kU+bX
	 LiUgI/mD9ioQZmvQflpfTccLBmC+QgQCmKKCFvqIhqQJ8yow7qXpe/e671dXHAGTgzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7a9BnUW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31455606A33B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7a9BnUW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850181F0093A;
	Thu,  5 Nov 2026 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863649;
	bh=kadFEy+/72y6ZOpa2TS32E9qFJbHaf1fMrcltpT+OOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L7a9BnUWQNd0fA+JejPbn25bQN3yxib/ZgpPuJksSsSWLUDpK9mHb4Id9AC8+xF7i
	 jtrZ9B/numoi20fKLh/PYl1MIkoIfnkot9n8nB5YgkPpMn42g3taKcU6I1Kw1RwVGa
	 1Nj0SV8ZChbWYCHlMLTXHDijnlDJCX72kULRoUs6rva8M/cwHtTuRb3DFdCr2I3z/3
	 ODoUl6uNzBAhIiPZCKCBYkAQNfrxUq+SLBBOxWlvycjleRAsTcX6WwHQuNNjNR/Ji6
	 8cBJ7KFbtTyIMdBFzkHjyZAX3wGbCL+Q7tEgfAdSFhbsbsaylrGh4voPBbjgVaNOcf
	 TfwmLIB/daCwA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 10/13] media: uapi: cec.h: add CEC_EVENT_FL_STATE_HPD_PRESENT flag
Date: Thu,  5 Nov 2026 08:22:24 +0100
Message-ID: <81a832c5568748e37f081d217998f80880ab8dc4.1793863347.git.hverkuil+cisco@kernel.org>
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

The CEC_EVENT_FL_STATE_HPD_PRESENT will report whether the HPD is
present or not.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/cec.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index b1b5f4748583..d595ad744431 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -455,6 +455,7 @@ struct cec_connector_info {
 
 #define CEC_EVENT_FL_INITIAL_STATE	(1 << 0)
 #define CEC_EVENT_FL_DROPPED_EVENTS	(1 << 1)
+#define CEC_EVENT_FL_STATE_HPD_PRESENT	(1 << 2)
 
 /**
  * struct cec_event_state_change - used when the CEC adapter changes state.
-- 
2.53.0

