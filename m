Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304634751B;
	Thu, 16 Jul 2026 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238911; cv=none; b=LHn98jUn/roi+pcIk04utbXv1/JbsDi3EEK7olFySBotgnb9mZxwhXU9J30R7bpZX4/z+48lD+pIrhYWCOqQIX/9t1CL3UllwP9aWJDP/gYMsUcVJGjiJadk5MG9y/PXn5Hk6btQB9+flEa8OQeQypAhCWCVB2MwUY9JROHfJ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238911; c=relaxed/simple;
	bh=qIQuH340WLs1RyhUxytZ2MQy9ilVj2FwiBv0TNIu/kI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j8kSZR8TwPiuEfh4Ul0jTe8AmoDy7G/2WPgkkWG/a5Ai9aMlBO0tXLBS/W9gnDmUY8V2QiZiIh4CHgRGU2WkJz5kN7RSET8orgwa3JUIJPu/cOTKrHEKfH+M0NLBDkvBQexPNMuEiUNz/vhZmB+vvYrOnQivRKD+Zlta3cEaMZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rlaEgOw3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rlaEgOw3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B8F2040E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784238909; bh=nFPT+iIuw/qnaPOgfDHJ7MQURbBeXra2UpBx8a8iAIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rlaEgOw3VLkjVeCdlVYm+SJSO/0unWmp7roU9yhkAud6JQuwtDGGl3dCZVw9BALJn
	 pq5ql9XqqvkbdwVvtm1aNvCGI+IK2uMwv8ErHcIKuUO7KoATU6CidDDBgd3M6TQQYc
	 qYf1lmGD34ZCNkK0PfzPU1GADxrYpQ9yAPSqx11GhCrtJfM8ibiMcPCsrdvhTI07NJ
	 pyUBmC1UQt7VSfahrKCnGDSXkocH74CXhRpvcx0958sKuUYE+UHS7bV1ftl0Ty4fFA
	 kVHp3Jyhke+rW4oys7BVGL1rA8cMM6TM9dx91/UdLOU1RzOt4NOcYKlNnAUdUEk8QB
	 1tAiwUnxxweCw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B8F2040E3D;
	Thu, 16 Jul 2026 21:55:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Clinton Phillips
 <clintdotphillips@gmail.com>, Daniel Lundberg Pedersen <dlp@qtec.com>,
 Hans
 Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Petr Vorel <pvorel@suse.cz>, Randy Dunlap
 <rdunlap@infradead.org>, Rito Rhymes <rito@ritovision.com>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] docs: custom.css: don't limit randering to old 800px
 monitors
In-Reply-To: <20260711094821.5e262356@foz.lan>
References: <1950557405f1150acb1de50de1801f2413223b87.1783673996.git.mchehab+huawei@kernel.org>
 <87fr1qn9us.fsf@trenco.lwn.net> <20260710211953.2a3dbfa9@foz.lan>
 <87a4ryk4fc.fsf@trenco.lwn.net> <20260711001015.3cf5d166@foz.lan>
 <20260711094821.5e262356@foz.lan>
Date: Thu, 16 Jul 2026 15:55:08 -0600
Message-ID: <87bjc67g77.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> +div.body {  max-width: 120em; }

For me that's still painfully wide, but I guess I'm weird; I went ahead
and applied it.

Thanks,

jon
