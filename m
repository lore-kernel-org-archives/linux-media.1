Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB93DB334
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176046; cv=none; b=pErFi55+vcgp/F1mG86FU39UHsOKvRAe+HBUKBNCghgD2v7nhaPF7GTce7ti2OeCLdx1RqTx715LN2+72Eebzu5DwWcJ7Q7JMY69sQpsOjklTV0VS1hcVO1sY1pEqkRVEwgJ/KciF3wOCsvffFSNjLx/HUB/EuxTGvtsRRv4tz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176046; c=relaxed/simple;
	bh=La5eLg+856u6yb2356E19wq4qWMjXt4WDF8YAZskR9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B5qIw/b9eanYDYonyCnHabPv5UVSOAGag52FwRLE+7dkwRaVrohRy8zqbPev4YiT4XAR5L5wFXLVQPVZkr6Nm/giprXeAALmvPSVINFbMP89QZ9dQTck0k3kJEjY6xVGGCtZlpdO4b2vF7KT4Vz1t7Zfx4b7FsugtD/2uOGUY6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OCGSMoew; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OCGSMoew"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bed3550917eso539978666b.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 04:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176043; x=1781780843; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLWe+2FcDOwhw41u/Q69O94pEc+gWeJDYXa+4qvlFG8=;
        b=OCGSMoewx9NxYhdC2ZXfrp4EW0WV/66h6Enu8HodLgYQOJr0EROLrNUkkUxarnvBXq
         t3DWivV5jCuSFfeVWedg6et+EEHw1VgOsicqX1dKetHQEdMMJFNmh6tR0k5IkwwOeWgh
         vPg7J1mpcR8mJQkuajKInUaLh/mkUzYuz98x6dq9PS00VEjrU68KMDJpShts7vvciM5B
         l2tJceBBdy3q0Xj8veNZ+vE/hr6P4839QQ1d9Y4PnToR+1AmIVJH5uvyvX0EmmFGDMNT
         pOh0wSaZj6GMSkMEADlABwCiGE/kzJqjPGLNI0AQSW938fmYtkih/Y5U+dfapwqTPyY9
         bmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176043; x=1781780843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLWe+2FcDOwhw41u/Q69O94pEc+gWeJDYXa+4qvlFG8=;
        b=svlDVaQNBXv1ZdPXfmZtH6owEhgavG5WiX9FD0d7JDiqi51W6yLhsfmgiUrqapHBOa
         tdoD4LFvQXlFwnvEy2YL7u/Z1s+9xiLh4XlF1wQBoAdAQo7gpK4ak01c3UQ/dd6IKvjq
         TVK8T8YxzNy05tkVDUD602meuLerTwv7X53y67vM4In+RlTMnnwJBCuspOrfxTV3QYzQ
         l50B5UM2fCMalUTTltV+mW9UDqy2aRoMdBuQlIvKASz3GOnHk89VFo+Aosi0KEr9C1bg
         faVy1QQCI9QV6k4M0bun4RYOzhmm6MDwUqbVFIn05ZiieeZh5gJhC3N9jPh9usymuP4N
         TvDg==
X-Forwarded-Encrypted: i=1; AFNElJ+hM3J/rRBC6x9D3FT4C8qLGDE9x2HVXCUHZmEfOHLn5hxZY36q1rD/Px4mqcgTEr8n4s2uJ8K/z1pvpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTji2KY8JnVqyVkQXJxF/QxiGrer5SjLYCO9rGoKzRw1k00No
	ycWGjRW6RrwCzHNmnAdL5T/G7G/f7YedHbobwB7/ue+bNCxBHtWrubLfLksNh9uSaabBkOxReUN
	dkFTIY+pVZOy4eN+0Yg==
X-Received: from ejad6.prod.google.com ([2002:a17:906:406:b0:bf1:4fcd:aef0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72cc:b0:bdb:4cf3:7035 with SMTP id a640c23a62f3a-bfc85745bd1mr113064466b.4.1781176042458;
 Thu, 11 Jun 2026 04:07:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:07:21 +0000
In-Reply-To: <20260610162433.923550-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-2-lyude@redhat.com>
Message-ID: <aiqW6WcagiyiOAKZ@google.com>
Subject: Re: [PATCH v20 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 10, 2026 at 12:21:28PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
