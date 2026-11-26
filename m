Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712256;
	b=00ozZ4AkNaU0z2+sKy0yZuJmZGL59ZGiRkynT6/Q2iEjsHjODukO4g05ooV9LF+yii8F
	 3zt/GSnZpKOi3b+8plenYzwXRoluYIIzkLhxxZ2LGzoOKgqdHogUicqT+ACNefrG6y682
	 uuqEo544fa1N2SmeqNfT+k0jg2OFmi2C78KS2Mm904EI8DdBL0dJMLsSqu1Qf9OvDmzH3
	 apdZZxPU0HiFk9rtehr1DkPrkE7kyB+9aKMeEhmpMZlwnbEuE48A49sqdZKyIqt6A/fFW
	 PI1P9xBq7Z6EnWeXVKKBGQaerfn6QObM3jSDPy7pRsp6/ZudLosyZEoVSf9/zll2l/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712256;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C7chu5hIGEjOayoM1ECc81R22rVaUmdhQydRU1keYUk=;
	b=cnO91RSvjqQqC85ZRXugmfKW03DSfQtOnLwEYIzubRZGYH2ZZ22VuzJryFps7jJEvxNa
	 V51JxOBmLheG9+SgyquSWvsDJjwYN5KuWn4gTd+ZBfxbbJBbti0ZcECNzY1s6qe55gi0N
	 HYzREgQlqXxCEbfJ1NlGYCoXw09QvVutG0vVqjyV/rnLNaM1i7u5HfePKP1oGh9njqu82
	 JJmZQrMXwQ12PCsKwFLz7s/TCXsclmGWumTqfvI5pREsFw/rfBwCXi6pdUgSjBZZDy8DI
	 lgMNsc00JteYcpxWFDe2NWHo4f99tImYWtz+rltACKApAuwcp/q/yD71T+wvIABbL6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ll9V4kOv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D80606A31C;
	Thu, 26 Nov 2026 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ll9V4kOv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712256;
	b=IF4x7TlqHzw+//X+VjtjFqmApVb1Bu76AzXpWxrQDMLd9nVhGNJcHEFFkRPFS5ZM8zQP
	 aK5PqLsBYwaKFPN64Hg+9SKs2Emg3XWKlDi3Xbzq4BuH85gqG/3BuxVlb9qaKUxDiHrdh
	 rRBLCwB8vUOXelAcFDVuvtFXNe/u/pU8+imuJmX0PHmTSz9Rkbv65QoMe2mltQdCC2z1A
	 WBAPR5qhN+WC1fei8zh32c0sUIuU5WUDm54Qr6M+Rcet/3NloMoD3uq95cDA+8QI/Bx2c
	 qq88E+7G89RIN50DU5p1lcF02jh03FWADOlcrkVyRgWzHFafO8grFxwa2PaDf4W+zyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712256;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C7chu5hIGEjOayoM1ECc81R22rVaUmdhQydRU1keYUk=;
	b=v1jdgbVoEFoAWXYYdhO7hpbKJlGlm66A8TKW+SdNg7Bi1PGBsduXFDrvSzY0uvTYN74Q
	 h18hXCbhYY51wgPdbJxyyt6+5DiIBfPh/DRUobN5jW/wHCtf97bggN+W3gXr6BDgEUUd9
	 qwjNq8NB9gvI6zNP6Q/7VKPfsz2oOj/XKRB9nkDRfes0v/HgLutpmylLGAqq7BH7vBUBg
	 x/LAyc8l9PEgK0KUH/tatemTDTtoGE45l3N73eUaCCOoviJxdHqbTqAS8yfus1vyco+vn
	 yJlFV5pWdnQWL3opzseRFsPDw2kup6Y1E/cEJvC3s56kZ+8Y3nmvvHed/sROSI4A+ww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5587F1F000C0;
	Thu, 26 Nov 2026 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712256;
	bh=C7chu5hIGEjOayoM1ECc81R22rVaUmdhQydRU1keYUk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ll9V4kOvjzx215EKA7CZ2rqgT576smdiERgr9DxRF0EYLLEBLGjqflmBCJVDvAOdT
	 hVTZAxquacYcPLVDIH0qqLdGCBeDruYIhU+/I+Ks38qFDkSy8FJj10xwH2/4zlzQhR
	 mbvIEoIBuVqe9cDoadAsb/D3SNlRlkJQpvHmwmJOzPrj5BGiWiBNYJoBDM1wbGw247
	 96hpXHs9Oo3Hg/iUV5uxW+3gSpZ3V/Y5VK0ko2FV6RnEMPH5M239pTaOSFpNMORjHK
	 yjocce0KkpG5pENvVxRNrnbb3tJajVN59ysaMVkxICIglcx0poBErF6eD+sfmoPRnz
	 /fW59xz6qWzoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AD38B4D71A;
	Thu, 26 Nov 2026 16:57:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 16:57:33 +0000
Subject: [PATCH RFC] media: doc: dev-encoder: Define CAPTURE sizeimage
 across OUTPUT changes
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-b4-v4l2-enc-sizeimage-v1-1-dd2cb99bd717@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBBFr1L+2gGThmrdCh7ArbjoxFFHNEqmF
 rH07kZdvs9/b4RJVjGsqhFZBjW9pwJuViGeu3QS0kNh+LlvnPMNcaAhXD1JimT6Fr115bRsI4e
 aF4FbRnEfWY76+nV32G7W2P9He/JFYv8tYpo+V+2VLH4AAAA=
X-Change-ID: 20261126-b4-v4l2-enc-sizeimage-89cb43b74b9b
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712252; l=2845;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=XKGgebnQg4fTpw0GKxAwBfwheI/TATP21n+3dmlxlw4=;
 b=BtgJpIITvXnpZo8HC5f0uWbkNs9IXNi/JXpL+4BP/Xuz5sIw/9XZeJ+7GoW/u9iembj1tQvuK
 IYOYmnjMQ0lC0ODVE1wBA2aIi7mKceVuBQiaSUqmersHlSDTeQXSOdg
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The encoder sets the CAPTURE width and height from the OUTPUT format,
but the specification doesn't say what happens to sizeimage then. A
client leaving sizeimage to the encoder (0) gets a size for the coded
size at the time of the CAPTURE S_FMT, usually the default resolution,
as the OUTPUT format is set later.

Document that setting the OUTPUT format updates the coded size, and a
sizeimage chosen by the encoder with it. A size requested by the client
is not reduced, so clients setting one keep their buffers.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Spec proposal asked for in the review of the Hantro JPEG encoder
fixes [1].

[1] https://lore.kernel.org/r/7a5a79bf8e1bfe698b7a49aa9580eb3858c25993.camel@collabora.com

Today vicodec, allegro and iris ignore the client's sizeimage; venus and
wave5 recompute or raise it on OUTPUT S_FMT; hantro, coda, mtk-vcodec and
s5p-mfc never update it. No driver change here.

Open point: a G_FMT/S_FMT round trip (v4l2-ctl) passes the old default
back as a non-zero sizeimage, so it then counts as the client's choice.

Developed with Claude (Anthropic), which wrote the text and the commit
message. I reviewed it.
---
 Documentation/userspace-api/media/v4l/dev-encoder.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/Documentation/userspace-api/media/v4l/dev-encoder.rst
index cdad276d00bc..64f1297dab3f 100644
--- a/Documentation/userspace-api/media/v4l/dev-encoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
@@ -156,7 +156,8 @@ Initialization
 
      ``sizeimage``
          desired size of ``CAPTURE`` buffers; the encoder may adjust it to
-         match hardware requirements.
+         match hardware requirements. If 0, the encoder chooses it for the
+         coded size and again when the coded size changes, see step 3.
 
      ``width``, ``height``
          ignored (read-only).
@@ -230,6 +231,12 @@ Initialization
      default values, based on the new resolution, as described in the next
      step.
 
+   * Setting the ``OUTPUT`` format sets the ``CAPTURE`` ``width`` and
+     ``height`` to the new coded size. A ``CAPTURE`` ``sizeimage`` chosen by
+     the encoder (the client passed 0, or the encoder ignores the client's
+     value) is chosen again for the new coded size. A ``sizeimage`` requested
+     by the client is not reduced.
+
 4. Set the raw frame interval on the ``OUTPUT`` queue via
    :c:func:`VIDIOC_S_PARM`. This also sets the coded frame interval on the
    ``CAPTURE`` queue to the same value.

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261126-b4-v4l2-enc-sizeimage-89cb43b74b9b

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


