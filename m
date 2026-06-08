Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83673DD870;
	Mon,  8 Jun 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931386; cv=none; b=JL7GVIHxwwVzi/RcwKsKbGUS1UHNWRMD1EGypLy0fzw71OX2ayD8QWoc+QBQUlbcFZc2A+pTPBCeRGx1rJ24AClqjD8RxxuEwFikgt1PWXgvf9ImtxicFMMKchC6gfAJ3V7zX6lpezCXH1DlLrL/d6pdPOATK0DFHs5Xak/qXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931386; c=relaxed/simple;
	bh=rk6daW5wXL6tuqthiNFawo6VQO9nBEkKmpeIDJXGYfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEzgkNnt/c3lHWXFVqmgcp7y1lzR4EQhVUfDX/WOx4LeB9ZRS3zNMqS6b0yiWqNEwXfSpSP3cFgaaQYKb4RkuurDHToIySVYClyfhIJCn4z+VVe8mSW9aKcHiVM/ideiRfVcpIMkW9lnZNtzvdaLrlMCaS2RolAG/P5d1SibAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRhJ+vnf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRhJ+vnf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8B81F00893;
	Mon,  8 Jun 2026 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931385;
	bh=Co7k/+gOSZIcFD9PGNraRj72Z+wuz6PGZinaRUIMtnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nRhJ+vnftIyHjc6NRR1Iks2S9yQe0j47VxL+ThXVgylzYOKg5OynbRb0ULeix5OAY
	 eLl2fd+cc32uv+7RnY2dVVr+2wbtN6YgjbMsVtLh0slNTmojE0QJ2NmCrqwwYMl3cv
	 lzdXs0UBGMga2C6quHIXa2wWxxcSuAFTdAHnb8uqZ8WZgBx5BbhzJqFQuzu3p1Fghy
	 fRs/xb37scUz+MGq1XSoa89+7L9W4FrvSalR6yHc78+yS0UtIuA+98Zc673VKebNAc
	 S7F6DzNIL0FWtZeqOZ3zupzOmmgsMnNuOSvsKl4kYyTLC1kheVXEjKU+Akkg7d6KmQ
	 /MZMC9KQnM7ng==
Date: Mon, 8 Jun 2026 10:09:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/1 RESEND] dt-bindings: media: mt9m114: document
 common video device properties
Message-ID: <178093135167.2704613.4351811660859253760.robh@kernel.org>
References: <20260531092924.12929-1-clamor95@gmail.com>
 <20260531092924.12929-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531092924.12929-2-clamor95@gmail.com>


On Sun, 31 May 2026 12:29:23 +0300, Svyatoslav Ryhel wrote:
> Document common video interface device properties, such as rotation and
> orientation.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

No one picked it up, so I applied it, thanks!

