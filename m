Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780433;
	b=2jQG8LbRbcwYQqk6NC1sxAQoDKwSaOiIxKwd0kp/ICSyBeNkcLU4DHejTXVEflvPj6Ty
	 BxMcw1zZxW06uTdIJWxvEz/gODZ+cFvC73VbEhJ0aHJyEugGUf8uvnhc7yBq9Hp45LIN0
	 J+eAv8+GHv3h/DHDx/WOXr6hk1OApSbBUIe62z/ufL6/0VID+56owbqxGyKFQDrnKTcr6
	 ldpiDtP7D0Y6HCzEYRVXSRdhtYglVWfigARwXcp1k+MIH+CJ5YImrC4DN7YYAhTeV7cT0
	 6DNtmsI8DVh7OSUCCNuwYW8I5z5NSoPNr7B31vpFKF5a3q7EpACVU0ywOfX+4rZGEfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780433;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To;
	bh=6tFmyAKl3TXYw7GdISc3v4tvYWnA4KFaP0LI5fdW8KM=;
	b=PUZiy4gJ1RwZgEFExoFq2ufsw4Dyz7x6dPTz/02o4dAvvX0P0uxycrSrVXgRsEf/yTJN
	 +EdK/8e/W12NaJQgv4HCTjEsTKKlHmEMG236TvXIkadOdavi4C5pqwS76FrW0qNnEJvoa
	 bQWDZuTJ1DGZqFLifBxKNgwgkhZ10qMruXtcJObBSCi7CUurFt2B2VSrRVvH+z5E4fCzd
	 xuqfkzhrdC0guUotfLH2egfEtmsH/G25wl5/llGWQVlXPpx93jRoJei5ngo0YQkcUBGcB
	 TH8XNAiiF1LCIQ1J/zTWcUTmJDLVIAkoSeJZtdru3usK6iF73djJjwr/cmXY7NxY2Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMCqPm3U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3097A606A31E;
	Fri, 27 Nov 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMCqPm3U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598EC1F00893;
	Fri, 27 Nov 2026 11:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780432;
	bh=6tFmyAKl3TXYw7GdISc3v4tvYWnA4KFaP0LI5fdW8KM=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=LMCqPm3UyC6hhDjz1bVyrTScq6Cuy8LxDb8t6owUObO91YVDVBbRaNyWduk1hyDDl
	 JP/wmYEU6R4xmV3mB8O/j3oW01CX6jsaqTizKQS/z+B0A9jTMhXA8WcLuBpcVwBE5s
	 qAnLqkACrQ0LAoIOh/iqyBiFzTxEwbNqRJou09sjiVxPIus3dksSH5/ZweC5wTR1iH
	 uvYGD9phpxvFwnju9TuAFcvZO3QggLw8CbZQGRoOHh6V4lkgNv4XRgcx8owWFMSzrL
	 rFu8AjVkkTA7m9oBGhok2ZfcuF7UwsfGMJa6w/JCN0O9I8vh0FLkAgxkT/w+0juqiO
	 S6OoKvop9IyHA==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 12:53:42 +0100
Message-Id: <DN5Z15CLM3L7.2469NKSE6ASED@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] dma-fence: Properly order timestamps
Cc: <phasta@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Alex Deucher"
 <alexander.deucher@amd.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Matthew Brost" <matthew.brost@intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, "Mario Limonciello (AMD)"
 <superm1@kernel.org>, "Aurabindo Pillai" <aurabindo.pillai@amd.com>,
 "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>, "Gustavo
 Padovan" <gustavo.padovan@collabora.com>, "Chris Wilson"
 <chris@chris-wilson.co.uk>, "Luben Tuikov" <ltuikov89@gmail.com>, "Shashank
 Sharma" <shashank.sharma@amd.com>, "Paul E . McKenney"
 <paulmck@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>
To: "Philipp Stanner" <phasta@mailbox.org>
References: <20261126172046.2473303-2-phasta@kernel.org>
 <DN5YMFCMLL2E.3LMY2Z5ZQAYFG@kernel.org>
 <b6b75395da594c4bf8deb1daaf857854565c66cd.camel@mailbox.org>
In-Reply-To: <b6b75395da594c4bf8deb1daaf857854565c66cd.camel@mailbox.org>

On Fri Nov 27, 2026 at 12:43 PM CET, Philipp Stanner wrote:
> On Fri, 2026-11-27 at 12:34 +0100, Danilo Krummrich wrote:
> What do you mean with that, like not backporting it?

No, the issue should be addressed in stable kernels as well, but that is
different from providing a temporary hotfix.

There's usually no reason to send a hotfix for -rc6 (this would be earliest=
 the
patches can reach Linus's tree) for a long standing issue that was never
reported to cause a real bug.

If the proper solution can't be backported to stable trees for some reason,=
 then
a separate fix for stable makes sense.
