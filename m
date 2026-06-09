Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28781E1DE5;
	Tue,  9 Jun 2026 13:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013466; cv=none; b=dpUzLiagvmXr+wV51CspsqJxFM3RThGR3h0gZHUfclC129Ew0eLgdA0/6gEZ5Ch+WkeaKoOGwp0nbSA8aSHlCJJig++JpVfRAq9gh19SfECdg6HppEeSIDvfeWpdzH0htUGNM0bBScSCWJSmJ0asBaYOq5UUQC9iHrcH413h+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013466; c=relaxed/simple;
	bh=OjPy0wHWPHxDDCt9avIjEjgVyhW6jMoNtYHb6SJMiFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EPc3TAL/kdEWI5fVvXu8djPUGmWSs+Vdn2bH2eDuVkVVbghZ17QolJbD7yVEhDL+mjpByKb2yrMTUQ0OBQjZXAiyL6WnytHBkLRB40x+vyqjpeplnpcsvq5dIuh2zvcEJHv2AJUarPoDaHoIAED0bvepWe2+PQu3u3Z17szLWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QpZU08Ii; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QpZU08Ii"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gZVpr3WVDz9v0Y;
	Tue,  9 Jun 2026 15:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781013460; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OjPy0wHWPHxDDCt9avIjEjgVyhW6jMoNtYHb6SJMiFQ=;
	b=QpZU08IiRNoQZ/esRxcZaSbRoT8Q87BwhQfEi+u/8Hg4AAvrbovWbJhSbNDl1mKI67q8QH
	yN5uKssrKdgHLD3cZwF5bLSlSWlFlbyTvRjpJS+ReQFCwK2+EKpprvQJ/Cz8BGsJ8zvdFL
	TX2rPPQ/h161qBocrXodYjsBaj1eD9gBrSQfRiKhKVm/EjNl+UcYCVe6OUNW2pKmxPXZ1x
	O/J1J9SiTmB8lepiwOEdZIeOIOiRmeQWkq5hczvlexqjJFok+rDLxd8Mc8m9e7TdktNWSd
	+v2fSN79/97eauKMaHLqrgHrCc+DpR+aQ0K/QYNCzFtjA03pFWk79yne5aeszA==
Message-ID: <6b7bcc667f294b248f51e890964c707f4545cf92.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, 
	airlied@gmail.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>,
 linux-media@vger.kernel.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue, 09 Jun 2026 15:57:36 +0200
In-Reply-To: <dbda178c-bf02-448b-a88d-5a094adea5c0@igalia.com>
References: <20260608142436.265820-2-phasta@kernel.org>
	 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
	 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
	 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
	 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
	 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
	 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
	 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
	 <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
	 <dbda178c-bf02-448b-a88d-5a094adea5c0@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 731b6d731ee856e6810
X-MBO-RS-META: 3fdrtcdpt5a9q4q46qe4r3g76djhgqse

On Tue, 2026-06-09 at 14:36 +0100, Tvrtko Ursulin wrote:
> I wanted to ask something else.
> What happened to the idea to remove opportunistic signalling from=20
> dma_fence_is_signaled?

AFAIAR that was declared impossible because some system setups like
mobile devices don't signal the fences with an interrupt handler, but
have some sort of daemon (in userspace) who peridiocally wakes up to
update the graphics output. It wakes up every T milliseconds and
opportunistically asks through dma_fence_is_signaled() (and that
through ops->signaled() which fences are already signaled.

P.
