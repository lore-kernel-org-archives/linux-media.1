Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC753CC7EC
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784150874; cv=none; b=U7VxnQdy1dctuHhH0z9XkYXVrZaQgNoagqXaSbI5/wpOpP4mHyIrz+gfF7e3YtmWUTSfq7EwmObsFu403PaSXh6TPmrJne2BodkENyIGV2lbyt7Xs1KbvfXdoS1xmDZ/HX+Dx+iN+kfahvpgjSgr37LuiWVExEaLT7cKy6AjRSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784150874; c=relaxed/simple;
	bh=jJn8V57H1mur4oIdpsQs+O5mYYZI+q+mleymDQ3+Mfo=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=aGBx/T9ATMYZIR+GMyEpNNKV7hqIppr0doK172fXxYOM9MPyBh8oxLjnYND8ZtR3JSX9XvcKyYCh+p8iyeKmS06QRPaAcVBs+G0Rt6sD176FUKOqrClM8e2eOmIUzhK2VV8dYEn9pH6ubliMhf1SX+vcnTGBBb0dsmMmoNWqSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=JreJtTDW; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="JreJtTDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784150864; x=1784410064;
	bh=jJn8V57H1mur4oIdpsQs+O5mYYZI+q+mleymDQ3+Mfo=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JreJtTDWU5LtPeIDOmAacZA0cg81OzXYSHauQ0aDnB9HyJWN7GbMxtDPeIEawyQPy
	 PGwcygP/Qg3kushnnAcmfi+r3we1Y8GLmeRJ7lFBk3Q657sZmiat8FZwDOKGWif94T
	 L4Pae4W9onTfq8JRqvv0LfuTReX8K2sgkdv4i9+OM9VnpixSsOTwr0kyCPQAkzWTcX
	 TTpZUs510L6cvQelkIrI5lA7KKHQG08SIttANKrm7sRmRh+SDtflbmyXebBKIZImhv
	 acPKlLiUuyZnT6jjPlA1PVhIUKIpIQkSs2ljra/m7zy5sUY/2Q8B9F+MxEdBpMlelr
	 SYzonj4Y43Iqg==
Date: Wed, 15 Jul 2026 21:27:36 +0000
To: "torvalds@linuxfoundation.org" <torvalds@linuxfoundation.org>, "debarbos@redhat.com" <debarbos@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "konstantin@linuxfoundation.org" <konstantin@linuxfoundation.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "matttbe@kernel.org" <matttbe@kernel.org>, "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>, "roman.gushchin@linux.dev" <roman.gushchin@linux.dev>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "stephenfin@redhat.com" <stephenfin@redhat.com>, "users@kernel.org" <users@kernel.org>
From: voste62ocr <voste62ocr@protonmail.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <v_TSkT4Pefxuwue-MRhQDralh5OKoRona-Y3-itUQ4r8gagkKwaPMnCOnvdNCeHZCXleOB54kJZl2L8sJZmbVMG78uErogWM7fuc3m8ow8w=@protonmail.com>
Feedback-ID: 122911235:user:proton
X-Pm-Message-ID: 74cacdda78c9cf440574a719ba59c14017fe46ed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>Because it's not like natural intelligence is always all that great either=
.

Oh wow, so I guess he now believes that this crap is genuine intelligence. =
In the past he said the exact opposite, perhaps his brain has been affected=
 from inhaling the toxic fumes of Google's money. Time to invoke the 25th A=
mendment.
