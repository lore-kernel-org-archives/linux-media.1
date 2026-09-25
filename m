Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18622495AD9
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332545; cv=none; b=Pe0A/oSCevC14TjumZ092ssXKbdvolCDGrFLVbD94RAGd5PXtV6pLx0mpIUqvyEYXf8a/KFWC1C94xUvSmps1R+1pPtXG1BNqJL0jAtHxrbhw3HuYhJStJPsUzWtFRtC44GmL+1hzD1dbDuG+nj6brcVzUbN4xQOYq+Ui4WNHYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332545; c=relaxed/simple;
	bh=mh/tZm/7r1sWbU/QfhkzIcpXaUFczxlorzW2SvJSOq0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJ5q/ackQtZJlvwy/5d6CN/70oGwFomIqJJKtP+P+H0m+igZxwEWu+t2FOfNVFbx0XJkwiANdnlXR7lvgqljnBkg4rAKdtes12+GKTHpkqM+R5pX0fb9+SHFZi39+qarQ5hOxAon4rlFNVBhJOzDYSLWv+zgB+5TRV6iIROfKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PvGGEcEy; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PvGGEcEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790332541; x=1790591741;
	bh=mh/tZm/7r1sWbU/QfhkzIcpXaUFczxlorzW2SvJSOq0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PvGGEcEyG0wuIpxFbepP2VDxc53/W5xuooKuRXemd9133Zo4S3L6PLznr/vZzFu+x
	 sejT5S8QBDBICVqT2QnXU08bt61qqxVNDY38luWO+RNL+WDE2q703aGbW4vpIDTodV
	 639/dZn5nZ2dY7SYYZb6EDW6n8b1rxV3nqQXjYQ+oZxEeBODiiVD3468Ub/wuXcS/4
	 t4nA+DFZSSFTDp4zqT2CCrG60pM7q/1cJkJiBW6OIkjm2d6cQrzb3XghNOMtO1lIas
	 3eenE4n23NY+VBPDrhNiiN4JWzbKD77z+qTlC+HBkZVgZ7N6db166FTQ1AZo6mYV2M
	 kaSI33ltVq69g==
Date: Fri, 25 Sep 2026 10:35:35 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-media@vger.kernel.org
Subject: Re: [RFC] ipu-bridge: supplying a vendor-prefixed property
Message-ID: <20260925103523.14665-1-lsa.uz@pm.me>
In-Reply-To: <arY4HDSQZYAGJwYR@kekkonen.localdomain>
References: <20260924215857.48545-1-lsa.uz@pm.me> <arY4HDSQZYAGJwYR@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: ecbe3ae9c421236c7719c24a382a2dd6de8cf5e6
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sakari,

Thank you - and the reason is better than the question. One ipu-bridge agai=
nst
a hundred sensor drivers is a weighing I had not made.

So: st,leds at the end of the list, from a DMI match on the board. Same sha=
pe
as the upside-down quirk already in media/next for this machine, b238116ccd=
4.

Not yet, though. SMO55F0 is in no ipu-bridge list, and the sensor driver is
still in pre-review with Benjamin. It comes to linux-media with his review
applied, the bridge entry follows it, and this property is third. Fair warn=
ing
that the driver is coming rather than arriving unannounced.

Benjamin, Sylvain - that closes the one question I had left open in your tr=
ee.

Sergey

