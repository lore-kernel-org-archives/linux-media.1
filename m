Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779275;
	b=UnxdOPWC3fruRH3WIJuyXIpmBqfTpUdaAjPl+F5CC7m304LOrZtw8C3ap0zgR2X+nfxa
	 /zbDigiXbmU2aEkiP+EHR8nCZ6ANR4l6sV91qOuWAE6HabehAaPQzY6aPTdO9rfjWYLQ9
	 9o48VRbLNQGP29PG2qIQqppnWWdbA2VPt3HMAVBGB6zbjRlVx4qCBfyQJ1xVO2E4il5/z
	 G1u7eHi9/Yaf18zZE57rubJACnMQ/GnP/EM1UEAYze8ZKY0x9BpZ7Rro23qPeLwLXjP4+
	 +Q6ntqWYPfi5JkVOM/ggmkf5k68TcoadmmAKBgnTmUf93LO/P/hZB3Oj6DKmbMoAdOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779275;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=+TtWQm0Jbb5pA7zQRAqTD0mcWKi7bUWXYCnzVEumBoQ=;
	b=ggyrt7BNPZA5tZ7U3TkF7vOK6lzmE3TCSwpRc8sAxBLpNOKUlDxLD9R4qUQCsCp7gyg+
	 p0Q05M4nOledPh3g9sf/gp5WL91vLJW6Df4RtMuICzB+yBaCLX4Fpfjczs8tCfFm71gST
	 I8FHjBVysmvqNH2Nf50BhFO4QDO/jiP/XVA3k9VswsHRBlm2xZe9JBUO1ZG4p9PM10lap
	 Ml05fRJzLBm6IfJhlV3IB5adJSv1qaXjtPzSNv5kcjms4cz6m6dOX5CWe/s8d368vNtt8
	 NKctnv9FwZI5akyqvlwd3/YmcnrwUIPZEb4OdW9lmyh9wYipHqMKSk7EANRDm0M4P4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJOdUt8f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC7606A31C;
	Fri, 27 Nov 2026 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJOdUt8f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E0D1F00899;
	Fri, 27 Nov 2026 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779274;
	bh=+TtWQm0Jbb5pA7zQRAqTD0mcWKi7bUWXYCnzVEumBoQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=RJOdUt8fsxedUj1n7Y8VN2eISd2hcoyKKn9lbvemBW7cFtbJ6GNosOj4rVAh0xYwB
	 ni66oMVmp7kWjavz3k4GsoTZ/z7Ocf2rvdVTKdQoVqIEi/0H7jpIsrMxQJcUGr3e8Z
	 D9v6+sjWR7WddwPfmc7n7qDOQCpYl1WzgwsCLz2JmJMO+RRQlAUmVnhUh+qVXvW0k3
	 ULADG47FUAlhOGp7pTieQyBsq+hKcDoZ1Nat6uEYf9d3+j7co5BxA/1fA1Bsw9HSGh
	 Tle8wYM4s4TIN4kJe/gDKJHVKRZ1bSnB7/92fao2BoK4UziqVa2GTLQhrDijVXrV71
	 wNjdUY1JOImew==
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
Date: Fri, 27 Nov 2026 12:34:29 +0100
Message-Id: <DN5YMFCMLL2E.3LMY2Z5ZQAYFG@kernel.org>
Subject: Re: [PATCH 0/3] dma-fence: Properly order timestamps
Cc: "Sumit Semwal" <sumit.semwal@linaro.org>,
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
To: "Philipp Stanner" <phasta@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261126172046.2473303-2-phasta@kernel.org>
In-Reply-To: <20261126172046.2473303-2-phasta@kernel.org>

On Thu Nov 26, 2026 at 6:20 PM CET, Philipp Stanner wrote:
> I propose stuffing these hotfixes into the stable kernel / misc-fixes
> while we move on on misc-next with a more proper solution. I'll post a
> series for that soonish, too.

"Hotfix" kind of implies that it causes serious issues for "live" users.

One of the patches says "fence timestamps can be written and read without a=
ny
memory ordering since, presumably, forever."

What has changed that this now became an issue that needs a hotfix? Do we h=
ave
broken users?

If so, it would be good link a report if there's one publicly available.
Otherwise, I'd suggest to just go ahead with the proper solution you work o=
n.

Thanks,
Danilo
