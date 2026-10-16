Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640124756CD
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153886; cv=none; b=Pp8Guw+sWrCIzVetrsk815RHFQYgFD7oDRb8OOW5MmhjVbWHM+NgAwP5XUuz3n6mMwA+6261PKMT1fTvxFj/r9aVTqZBtjNMjiUQ/4AjQGuWPi4Rdha6h4AAN4lNVgwy/M/QeG6sbnd3h/yHehBXHBWQZJLYD2g0emDVDXkZrfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153886; c=relaxed/simple;
	bh=7GYnwhI3jVn6b4pynLH+o13sxdIvDiuogpoaPN+NUKU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PyE6I7ucXoqwGarL2RBxjKIo/PEWIrMTt7m+iLO1X7tWh3WM0md1atWQx4WKz7uAz4Y3PWkqtwBpGeGNnZYxb35iYhf76IpAK/m26zaqHzvp2BFLcIQ5Cu2as2zib9Ag1TSwR2kVbmBKpVGXQkcm0xhma2wLozvJiOfBd9Bdk9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nTpqpyy1; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nTpqpyy1"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1ad49096fso10174805e9.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792153883; x=1792758683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7GYnwhI3jVn6b4pynLH+o13sxdIvDiuogpoaPN+NUKU=;
        b=nTpqpyy1+/6yJ9Nzsq5cscAtUzDxSgdDj/fT4RhYokPB110+5OpoZg9C03Fk0Gyebu
         Xx/IyXtLJYT0mYj/8UurvPdkrz5qOeLUqSO+tXqwCmNjhg7dVmm9fZex2EN39y6ICe/L
         FbHELUV3iWYtpolnCz5IksOQD9J5yMONnlf+ky1Gwzm7VUVU2V5L5OWIATlly3TrAOUP
         Yn+3C+G86qPENxXm9z+Yg/hFx0HBmkhFO9/Ef7aJ1cXx3FizK0XI65ap6ZUrOUlU8J34
         zcDbDB8xsO9oZE/1S8TZXszn/b/TlslydKIfz1BrSzFa4cWtdOmuSXWhMyBdx23o2ekP
         m25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153883; x=1792758683;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GYnwhI3jVn6b4pynLH+o13sxdIvDiuogpoaPN+NUKU=;
        b=ArjQa2WeuVUwYjjiNDF6iV4EjQuJnqP72miKUt+m8cGhPpbVD5LQpVVuR6D8JefeqH
         dHfoSh/7W+KOa0adYbU792EwXtgsG8jUnclHIROGOkVJWt0cqflLQ40So5y9h1Uk+8Xt
         ChWSoxoe42dvwHdoBhxZQJSFeaaQ9X507vAKrihHUgZkL83vJkyllWBIcLUyrGoYOyav
         rkpDNnJerkOZoWM7s/VM1uTAythTUXxd6vfCzaU4QRG5FVlS1g6Pdc+S62NDgMFyM/oD
         7pHOXDXUEXzf5HnlXZaEiJMB6pDorMB/QqxsDmz1Pkx5BKd5yJwbX9cAZivk9+t0JGS8
         FkDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOsd+3kRkqG/uv3dLAQj+vYTsl7A5wJY/ZGZX2DwnGzss9gE/FacAXXEjNSxQDTOyo21DLYacV1YV47A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+aygQfcm1QB2fZ08n9vRWMI/Df5vsqAmZelN7Hv0wnm/ukUL7
	VisjLerh/b2Vw4GWnucaOs5VdVzBdQZViQ1yEb1DnKXLLp8xDctzeAsaV0QZHLoYR/d4gR5udFe
	5kFG81oEqXg3xZ3vBxg==
X-Received: from wmee11.prod.google.com ([2002:a05:600c:218b:b0:4a1:bd96:2aa0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c106:b0:4a1:7a1e:6910 with SMTP id 5b1f17b1804b1-4a1c6635d15mr53398115e9.4.1792153883281;
 Fri, 16 Oct 2026 05:31:23 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:31:22 +0000
In-Reply-To: <20260930122755.1657820-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930122755.1657820-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016123122.3744636-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: DmaFence: Remove static lifetime
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 02:27:56PM +0200, Philipp Stanner wrote:
> A FenceCallbackRegistration can stem from another party than the one
> that has created a Fence. Should that party forget the registration
> object (for example through a refcount cycle) and then unload the
> module, a fence signaling would run into the unloaded module, causing
> UAF bugs.
>=20
> So far, this has been solved by demanding that the payload data of the
> registration object demanding static lifetime.
>=20
> It turns out, however, that this is harmful because the static lifetime
> bubbles up to all users, ultimately potentially causing a large amount
> of driver data to be static, which renders the lifetime obsolete.
>=20
> Solve this issue instead through an unsafe requirement which demands
> that the user does not forget the registration object. This is also the
> solution chosen by ScopedWork.
>=20
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-rust-next. Thanks!
