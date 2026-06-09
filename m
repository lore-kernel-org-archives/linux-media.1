Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94682D8796;
	Tue,  9 Jun 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994627; cv=none; b=Mk8+jCfPjMbj2gM1oTrM0TSSr/Tqd1wkbZHdJCJ0f0kuWHZ9LRbZ2y9rQ3OWLmXW1btEl23Gr6pSyxHATe286L2YibORg9rnbIPdIlXVv1UeQ8n5wLOA3IrmAsPe5Vn3on3iimje+X2kG+1HsdhKubj+w8bTAaxNex7Z/UoEn04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994627; c=relaxed/simple;
	bh=LQR3SYdQSKJIq7EktnSCgv4axw3p+oqpyjcxCfjiFBY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VJNAN+R+Hm4RrSwjn5MGFKP9Jt5kNBqZLXuy7tCm+kifDfAWuaAZz0WELEk0C51DBTlLCLKFrTstEucOqj6KQfLxdPCwmgJnycxWU34lyFYBriWHrMLNEFiReWip2ltIJNLrx8sncVtVmlRc5DkZai3dLp+bw63NJ2Qzl+83klc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I2+G7M7O; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I2+G7M7O"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gZMrZ4qfYz9tyK;
	Tue,  9 Jun 2026 10:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780994622; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TutrcWV4weLV63rn6DOTmO8rnOaAiET3qj78ShPmQNU=;
	b=I2+G7M7O/nLScRZ49TGC3cmN5cfqPPb9zqKE76qw8auAsniWaqsyGncfeWPDO8CxwceK2n
	j7kRkmv9Ahxkk+odKi1D/c9V+0YvLZ8I+2GmNykowMd5B/1v7myJmQWaMebf7ugwNUXO0C
	Hywago82s9mMtYCVDD5RVhtaikIS93U8gDCPGYaYIA8FFMo2UpbeGBHx7kM+b2rWyeLifN
	pKFz4o4mmB4O4jrvFoA+cptN4QxlKVV21PscK+aqtAMGBERJUDDav9bh3Tt/Qo2uZQhiYU
	YV3nMRw1yvo2wi6tqueuuxh7mNkqbTA/ZsD2XGZZLmccvf4pMU9u5xklatzv7Q==
Message-ID: <739df49a9c0fc54e3d096f95f7d738081f6fcfc2.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida	 <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>, Tvrtko
 Ursulin	 <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 10:43:39 +0200
In-Reply-To: <20260608181630.20145d1c@fedora-2.home>
References: <20260608142436.265820-2-phasta@kernel.org>
		<20260608170112.24fd92df@fedora-2.home>
		<6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
		<DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
		<256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
	 <20260608181630.20145d1c@fedora-2.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: i8k4fmo6ne3hna7bsdyiqc4xaumfwd19
X-MBO-RS-ID: 3aff6afd757c241ff74

On Mon, 2026-06-08 at 18:16 +0200, Boris Brezillon wrote:
> If I were to choose, I'd probably go for a dedicated rwlock_t to

side note:
rw_locks are officially discouraged AFAIK. They utilize more of the
expensive instructions than a spinlock and are only worth it if the
read section is really long compared to the write section.

> protect dma_fence_ops, so we can:
>=20
> - protect all dma_buf_ops::xx() consistently no matter the kind of op
> - protect returned data (get_xxx_name()) with this lock instead of the
> =C2=A0 RCU read lock

That doesn't solve our Rust destructor problem though, does it?

What we want to do is:

   1. Signal the fence before it drops
   2. Wait for all accessors to be gone
   3. Run the destructor

Step #2 by definition demands the signaled-state lock.

Or would your plan be to take and release the ops-lock before the
destructor to ensure all callbacks are gone?

P.
