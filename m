Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345071;
	b=tJOIG163g9SF36YsPRJhmoMXo+a3xzi3QFzILT6OSh/Lis/JpzjxcdZrtlbq/3J+g7i0
	 Z4WDasd2G4RZOuMsiY4kQauGTJmJSheXFLiofxpaPE8YWFyS/5S5NQD6xfLWdKPUOsZ/I
	 ZH655rPrmM8wzc46qrP/d5a8eOQfoDTxLki0FUVsiXb333LMhcKPJgbfbC9tDYzUP7dCX
	 JLFOE6K5fCugs5CuXsKHbhUELCzE41zVOH8Kh6sOjsh08ZLlOM+5Xj4YezmslclVzi0dv
	 da11luTjgDLRSB40TVThPyfkEvJRDjrbrcrhEFANu0Zpt+tb/eGhHokgbY0Usf5Vapg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345071;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=m07oiY0Vuhff4sJHiKKC4hdtDmMaphFBUONvRhgCu+I=;
	b=wDef6uMJCi3gC2GVppgvqctvzlfs1BYAYRYH+64pJ+neUiWmXLZVrbVwcgGbOpqqWCeo
	 pw6i/bjE3drVqOKB8htSVHq6cNRPXwmlyGFyzi2WE1iurqTy1GvvT/7eTeqF/udYdbJxB
	 kfRPoulsCisCOLyTVGZKabfT0r10deaeo8EMrlGpNAnHn3+8/ebM3XwVwCjjwmdIiiPJY
	 ECbeXemqCm+Gjb0BF5Of1yDhLKXCQAKsH6+TKQHUFgCh7p/e7ImMQq4edIa0JpfceamdY
	 A0U0T8RQ32dcy/GuGdVxQasG/cPWabhPfO+uBuKmW8isDHVo3iQtK2Ms1DQHPDEB0lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9769606A32A;
	Sun, 22 Nov 2026 10:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9769606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xV5GF-000000001ns-33UE;
	Sun, 22 Nov 2026 10:57:31 +0000
Date: Sun, 22 Nov 2026 10:57:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dang Huynh <dang.huynh@mainlining.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 0/5] media: rockchip: rkvdec: add support for the
 VDPU346 variant
Message-ID: <awLKiyI-z6wdTD4C@makrotopia.org>
References: <cover.1795191822.git.daniel@makrotopia.org>
 <E8475BAC-F137-493E-B7AC-9C81FB158610@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E8475BAC-F137-493E-B7AC-9C81FB158610@gmail.com>

On Sun, Nov 22, 2026 at 11:44:32AM +0400, Christian Hewitt wrote:
> > On 20 Nov 2026, at 9:36 pm, Daniel Golle <daniel@makrotopia.org> wrote:
> > 
> > This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
> > rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
> > [1]; in the v2 cover letter he offered to pass the series on. The
> > previous posting [2] carried no version in its subject and counts as
> > v4.
> 
> The original offer was directed at Detlev based on conversations with
> other Collabora folks who were hinting that he would be able to (and
> it would even be desirable to) fold VDPU346 patches into his work on
> VDPU381/383 which was in-flight at the time.

VDPU381/383 has landed shortly after your initial post, 10 months ago.

Your wording, on a public mailing list, reads

> [...] would be happy to pass the series over to a more experienced
> developer.

I may not have been active in media/drm that much, but am generally very
familiar with kernel development and consider myself reasonably skilled
with C (also "pre-Claude").

As all missing was running the validation suite (and the minimal changes
such as the clock change I've appended to the series) I thought
re-submitting it with the results of the validation suite run would be
the right thing to do.

> However he didn’t take
> the bait and it didn’t happen. The comment is also pre-Claude when my
> coding abilities were more rudimentary. The main reason for the long
> delay in following up has been the length of time it took for Detlev’s
> and related DRM series that permit wider testing to land; a vacation
> over the summer, and then Claude distracting me with a deep dive into
> the Amlogic and Rockchip media stacks that’s resulted in 300+ patches
> that need a proper plan for upstreaming else I’m going to annoy the
> already-overworked media/drm maintainers.

That particular bit, making VDPU436 work, doesn't depend on any of that
future work you may still want to submit. It's immediately useful and
can be tested independently.

> I don’t object to someone upstreaming my patches. I do object to the
> lack of outreach to check on my plans and patch status before blindly
> (and wrongly) assuming there were none.

I didn't mean to overstep you here -- but 10 months of silence and an
offer to hand over the series didn't seem to require any coordination.

> You will find later versions
> of my patches with fixes for changes in surrounding code (as I work
> on something broadly equivalent to drm-tip not Linux 6.18) and from
> further testing in my not-very-abandoned development tree:
> 
> https://github.com/chewitt/linux/commits/rockchip-7.4.y

I wasn't aware of yout Github tree which wasn't mentioned anywhere in
your previous submissions. It also seems that this tree has only been
published hours ago, and doesn't contain any changes related to rkvdec
beyond what is also published via the mailing lists.
