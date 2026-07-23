Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F783B388E;
	Thu, 23 Jul 2026 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840374; cv=pass; b=joMcYhvVKO0tTvYTur7Yh4cWDcGSoj99at+fJVYA7qXX29AqGSF87P6FZPTidoEH7x3ZAtH0bj71qCMFO5/A4fqAMO1GsTVVDq/Pm1MVKM4f9a15jA8z6AsYWzp5iYVPC71vopl+mfvLbNSSc/AuyC5YJRbrbY6wh6OuNEussZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840374; c=relaxed/simple;
	bh=Lee8QzaIGOVkxp5kccjZ2szPEclChZL03xQKdIdhQXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCc4/hZ5tXRa0MHnSmXtyo6Wusj+NAIuAwIrPBiSfUzfD4og7aQXQYwuLRMIFVFwW9iQ+lRzEyPxeI4j4TwwCivAWBUttQyA/Jw0d4z4v4qIMV6ivf0ZQEjhssXqgROxTfJi+n7kza5psd4apoA+bS7+Qtakji9cdiPHEOLJx7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=cTPuqUgO; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="cTPuqUgO"
ARC-Seal: i=1; a=rsa-sha256; t=1784840350; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XHif2z3TyuE5eycS/9ovhpdeftUuvS6AkHk7IgpY5oUA6rhmHLRayF9fqgqAZMKYrbGdnPsx0/iHPl5xdKuufA/rHDuaZ6czUKLtaqFlsCaTlhkg/h+hLmJUMzurjW1gzSiBHuqWTCP5xSL99PAt5CBvJXLd4kGj6vJSAzrwcd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840350; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K7lA+u/oxodyHJlCoKL4TQghcRLJnH86jNWrERwY04g=; 
	b=Ooy0733DzYK2a2KdfEEyI5HxXZb1kZsHY8VSm2lDfEfvq7FZfMN5H7+Gl/62T7aS+DXcNkaHeJ70woPD6qPP4IPw6BRpMoBmCs1OgtmEclVsPi+3rowaZ4z2CwB3xdWL6RvAoJbgmEc5voTlAfnah31KwsLSKWYNZuUisUWkRJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840350;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=K7lA+u/oxodyHJlCoKL4TQghcRLJnH86jNWrERwY04g=;
	b=cTPuqUgOR8p7EZ8gQ0VPzQxLr+Hn38SKMcF+PqyywbCJ4mo7pJesyhul+cucfNHE
	hH20o+4Uykfo6bDrTduOWQriq8xzaTS6r9AiIqApBAQukfT4oTg6rgTXPzeTMw3YDq7
	aNC+dkurpflZKNaE12UYE3pRzcmIIvBXVwsjfwyI=
Received: by mx.zohomail.com with SMTPS id 1784840347474174.7560622262041;
	Thu, 23 Jul 2026 13:59:07 -0700 (PDT)
Message-ID: <b0db52f6-cb3c-432e-ac08-d864971a8624@collabora.com>
Date: Thu, 23 Jul 2026 23:59:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>, sashiko-reviews@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-3-royalnet026@gmail.com>
 <20260721070036.51C371F000E9@smtp.kernel.org>
 <CAEWPSH7FZw7XDhHD6x+mWcQR2VnLs5yF5LUGMisQoCsv43-z8w@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAEWPSH7FZw7XDhHD6x+mWcQR2VnLs5yF5LUGMisQoCsv43-z8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/21/26 10:51, Igor Paunovic wrote:
> This one looks structurally plausible, but as the report itself
> notes it predates this series: it concerns the video_device lifetime
> on the V4L2 side and is independent of the audio support added here
> (the audio teardown path was exercised on unbind with an active
> stream during v3 review, see the v3 thread). Addressing it would be
> a separate fix for the existing driver -- happy to leave that call
> to Dmitry.

No need to worry about it for this series. It is a niche bug if it's valid.

-- 
Best regards,
Dmitry
