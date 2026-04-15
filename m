Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8B3909AE;
	Wed, 15 Apr 2026 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239678; cv=none; b=HbX4tB8rKa1gPWBwR+0+ZVA8EwhsWf1T7qDP1FuUdLm6nRtP1r73Uz1xk6wyBOw2yuF++0J33d3iko472Y+zfRBSV2JpsxYSmWGAajCS572YqahtlLvpWXeBGTZqu3tIKaNv5kYbi8MrrRKxRxhll/+jNuSfmRBMXdKv/SEl9oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239678; c=relaxed/simple;
	bh=C4ofK9jbvn9z4VyYZMR5ON94C5OsYaTLYM1AsZCL5HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9JBz0o6aEvUcg7Upo0xAAo5iNrsyvZTBGl1UsUu6TYPkiKSyTQ5D9I1xgOBr76qCFrzLleUjTlcxvriHuhzhl2RUd6p7ipk86+YeQo/S11yIsfe6pNqvvm+8xHXbHDC+32Qnsw33oQa1nUxldArQ6YjEcRYHE6JSlpC+xESc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHCu4D2z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHCu4D2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF8CC19424;
	Wed, 15 Apr 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776239677;
	bh=C4ofK9jbvn9z4VyYZMR5ON94C5OsYaTLYM1AsZCL5HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHCu4D2zMtNd7tf4w79KsVr6vfsZQWrHGjIw1Tgky5EYTqn48A9mU/Jr1cW+PHJbO
	 +0mklAXXyfwO4vkWtsVF4UqiUSEfpcQYxXx+KsFrZMETIFoQCUb8K7Zn6LLblUztxl
	 c0Dji0EyJX1J/nmicqRCs7ZI5EZLvZX0uNLJhH6iMleueaKThWGRHSBYFRoG0g4cJQ
	 4xAFN2yuUZpxTpiyTRlqS6+N6UnCmcinJoQsbYNwy8N7TPh+c/4gwGl2dSMnKnF+mB
	 dyFj4Sq12Guvza+NgxGy/m+gyLB8kHycijfbQOdufyvH8WwyGfftcv4fvmB5/d5KBh
	 E2ez/O9E1/xCg==
Date: Wed, 15 Apr 2026 09:54:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Message-ID: <20260415-authentic-elastic-auk-eed0e6@quoll>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-2-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414084952.217215-2-elgin.perumbilly@siliconsignals.io>

On Tue, Apr 14, 2026 at 02:19:44PM +0530, Elgin Perumbilly wrote:
> Add bindings for Omnivision OS02G10 sensor.
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>  .../bindings/media/i2c/ovti,os02g10.yaml      | 96 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 103 insertions(+)

Your changelog in cover letters says nothing changed here, so same
comments as v1. Please go back to v1 and read the feedback carefully.

Best regards,
Krzysztof

