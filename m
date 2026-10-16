Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967C0446855
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144179; cv=none; b=lHytICjttHx8/epHHZNQXn7uLNz4CUBuySjwB9ILQS0zmFsBkMgvECOdJN8mahbXcrsFKusGoM2xuFwg69rhz9k55B56qPk08qdolqvM5qb9b9zMpa+wT0kP11ufIvAV8cboTnex3KNf4bFycK77x8L6WjaZKqmlj7O4Lw1wJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144179; c=relaxed/simple;
	bh=YitoetwPdH+i14xIu2SyRoM0jmdCM8cc+bzFzb4tpkQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fMA3uiVU/84jkzTcAA3OsmheLmjidxmbTNs+DNDQrycHRluC6xjGnLkge67y2247dJbj6j89HXNZ1dDfNfUDR5HVNxsUXaYQh5vWPLEMCvTyA8XhXcmaI8VhLC2zzI/eAh5wNZphHlH9e7Iu9dwrskYG3kF8RcMKtWmPZM2ZOAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j9/WvJ6T; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j9/WvJ6T"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f2de3ba47so1696041f8f.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792144176; x=1792748976; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ixy6hNcTUuWFgZUOYyQDAsnRCW5sJejSxzxn5qXltrA=;
        b=j9/WvJ6Tk3IO0RQS+GS+Gq3I/2FrBaVGzmhCQk1bLFmrH04Lv+5mpJ058SwRBpnHBB
         xFHpysTa3+Ndhu4pYQC0C92+Vzsqw0+m7G0DIPvZkcF/DurOruzK3tf+iLZvrSRK9U9y
         R/HXqEMcT7gg+APl9fYcVBbPoHuBQ8F8rw0USm3hOGHs0JFpNy38haGtXaSZSU2EC4hd
         59TG9/TaA6HR7YCtbWZUBE6o/pxspuXDoC+/u+NbJFEROapC+Iijm2KkEP32k8EXTdtF
         cSQXe5sepLx9M5z4IY9cbVD3NetqxUK19NEcz+j1vhHMd5D7jwAAiW0KF6gzojR6dMFz
         si6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144176; x=1792748976;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ixy6hNcTUuWFgZUOYyQDAsnRCW5sJejSxzxn5qXltrA=;
        b=UVZFDjVIFodba0FtbYAIA+cH8rhA0Q5cbba10TssOfUdsINzTrQWNHZXqp4CJTCRxj
         Yh+aLgNl2Z77XhMWPkNfkUpYjK1fuyOI8ttOODFm0MNZPWxnpgeCVmYG1gWhrEDLS/10
         WELpvpJpnK1ehmMeJohygE7WiP5IQP27btX0tiPhGI1PBX9y4rhaETzXphg4YKok9cZB
         lf5FZXB1AL1PRUTk9oGyYUphFamD6dJlbj9i4bDF5e45OYNcQLbyotmBgwT+bSk590wq
         9PGF88hS1kzVkIXBErsZBgmxtXG8nqOb3FjbbhmSj+Xyij2B5F8DCUTiYRQRWUGXiDZm
         7a1w==
X-Forwarded-Encrypted: i=1; AKwUvBw0LPh4KmYJunjRifFOOZlXuxOmod3VlqF/2Haiw6WSJ1ZbroXhnhMR4hTxyFRExwiuDWaqYPwCBadZ7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJv7i09Gqt0TLICPY/aq4AsYgIjWA16iURnCUYto64YK9BGRNSE
	lPFKd36zuJBGKYH1PVQrKXRKJz5bBX/myu5SlLNnPZwfwatNT84kPEFqDCAjRwc+CP4C1AChHO8
	WzRXoTex9O3twG5IunQ==
X-Received: from wrhm28.prod.google.com ([2002:a05:6000:181c:b0:48b:1194:3d3d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:46da:b0:48b:68:594a with SMTP id ffacd0b85a97d-48dbaadc11amr31197776f8f.12.1792144175630;
 Fri, 16 Oct 2026 02:49:35 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:49:34 +0000
In-Reply-To: <20261016085724.1031766-5-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016085724.1031766-2-phasta@kernel.org> <20261016085724.1031766-5-phasta@kernel.org>
Message-ID: <atHzLshg2bMc2-78@google.com>
Subject: Re: [RFC PATCH v6 3/5] rust: DmaFence: Don't drop on signal
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, John.harrison@igalia.com, 
	da.gomez@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Oct 16, 2026 at 10:57:22AM +0200, Philipp Stanner wrote:
> The original design for DmaFence intended to comply as strictly as
> possible with the "dma_fence contract", which, according to some, says
> that a fence must only be signaled once. Thus, the implementation was
> made so that a DriverFence drops on signal.
> 
> While extending JobQueue's capabilities, it was discovered that this
> characteristic causes - unnecessary - trouble: fence-data must be
> dropped in an RCU-deferred manner because the C backend demands that.
> However, fences are often signaled in atomic context (e.g., interrupt
> handler) where you don't want to drop, but signal as quickly as
> possible.
> 
> Actually, there is no real hard reason to enforce that a fence can only
> get signaled once, because the C backend is robust against multiple
> signal attempts.
> 
> What is decisive is that a) all fences signal and b) they only drop no
> earlier than 1 RCU grace period after signaling.
> 
> Don't drop a DriverFence on signal().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

This seems reasonable to me, though sashiko makes a good point about
being more careful when updating the fence counter.

Alice
