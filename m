Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1F175A7F
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 02:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746698; cv=none; b=r3wxU9kCaajUJkb9/l/5YGZQJjXy8QkjB/E6/s5LOxTkB1lcnGbf9hZt6gHqZcsYEa/6Rsavg11ERySmKSgpPEXe+yV/2HLbCZLV368ow7XkH0H/Wy5emgMsY0NVerohsiPbURHEiiXZ+uuV8ro8NAf+xD06MpRUrKQLsBogRFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746698; c=relaxed/simple;
	bh=Pf9bp+1KPEf5u1yo27/bfZz8o2cZegEYus/7FvEecaE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=N1OkgY/cZKwU3UO/3AU2b23V5zLp9BjWvW/Iqxz3rOjgDLvnXWbI6Rr95lsTzVgAbU2Vth5qcee1+9uqzZU0Aj3Yoal+oCOdOeeNRZK5O1Fdju1OhEJ6P4xRb62GFaigPtWiAL/kHibqsbxu9vmdbuanc0K/Veu5+c+jXV+qw98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BuTzJTmp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BuTzJTmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Pf9bp+1KPEf5u1yo27/bfZz8o2cZegEYus/7FvEecaE=; b=B
	uTzJTmpQJCFiBsllJGr5pU/Imh8qoGAgMtCxxerHblVoGA3TAse15y/zXx+mdjVU
	DxSCbbC5sPoSj1Bqy7jcboAYDRZBZlK/QHev8fB0eXd/vjm7hzp5zTRrBUpL2Cmr
	Msshw/gvEVAqQMvAKOpOPrylGmomYohdWcbA5FXDV0=
Date: Mon, 7 Sep 2026 10:04:31 +0800 (CST)
From: =?UTF-8?B?5p2O5L2R6bi/IA==?= <dayou5941@163.com>
To: "Linus Walleij" <linusw@kernel.org>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	"Li Youhong" <liyouhong@kylinos.cn>
Subject: Re:Re: [PATCH] media: mali-c55: free IRQ when remove while
 runtime-active
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAD++jLnVf8-o2XBWonLStH33+GfkFCbqORisM9JMZOhhbNxX6w@mail.gmail.com>
References: <20260903025526.2657105-1-dayou5941@163.com>
 <CAD++jLnVf8-o2XBWonLStH33+GfkFCbqORisM9JMZOhhbNxX6w@mail.gmail.com>
X-NTES-SC: AL_Qu2TCvufuU4s5yCeYukckk4Wjug8Wcexufwj34NTc98FiDnyxQAgWH9YIH7x+t6mDx6MnzWOSARs6ftfZqR/rSlK6AybEhhS4bhlh9mtIg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <13abbebd.1bf4.1a0799c23e6.Coremail.dayou5941@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3f7+wG55qM7kJAA--.856W
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC+RA142qeG7DY3QAA3l
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKCgoKCgoKCgoKCgoKCgrlnKggMjAyNi0wOS0wNCAxODoxMjoyMO+8jCJMaW51cyBXYWxsZWlq
IiA8bGludXN3QGtlcm5lbC5vcmc+IOWGmemBk++8mgo+T24gVGh1LCBTZXAgMywgMjAyNiBhdCA0
OjU14oCvQU0gTGkgWW91aG9uZyA8ZGF5b3U1OTQxQDE2My5jb20+IHdyb3RlOgo+Cj4+IEBAIC04
NjEsNiArODYxLDggQEAgc3RhdGljIHZvaWQgbWFsaV9jNTVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4+Cj4+ICAgICAgICAgbWFsaV9jNTVfbWVkaWFfZnJhbWV3b3Jrc19k
ZWluaXQobWFsaV9jNTUpOwo+PiAgICAgICAgIGlmICghcG1fcnVudGltZV9zdXNwZW5kZWQoJnBk
ZXYtPmRldikpIHsKPj4gKyAgICAgICAgICAgICAgIGlmIChpcnFfaGFzX2FjdGlvbihtYWxpX2M1
NS0+aXJxbnVtKSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZnJlZV9pcnEobWFsaV9jNTUt
PmlycW51bSwgJnBkZXYtPmRldik7Cj4+ICAgICAgICAgICAgICAgICBfX21hbGlfYzU1X3Bvd2Vy
X29mZihtYWxpX2M1NSk7Cj4+ICAgICAgICAgICAgICAgICBwbV9ydW50aW1lX3NldF9zdXNwZW5k
ZWQoJnBkZXYtPmRldik7Cj4KPlRoaXMgd2hvbGUgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSBsb29r
cyBhIGJpdCBvZGQgdG8gbWUuCj4KPk5vcm1hbGx5IHlvdSBrZWVwIHRoZSBJUlEgcmVxdWVzdGVk
IHBlcnBldHVhbGx5IGluIGEgZHJpdmVyLAo+dGhpcyBsb29rcyBsaWtlIHNvbWUgcmVhbGx5IG9k
ZCB3b3JrYXJvdW5kIHRvIGV4cGxpY2l0bHkgZGVhbCB3aXRoCj53YWtldXAgY2FwYWJsZS9ub24t
d2FrZXVwIGNhcGFibGUgSVJRcy4KPgo+SSB0cmllZCB0byBzZWUgaWYgdGhpcyB3YXMgYWRkcmVz
c2VkIGR1cmluZyByZXZpZXcgb2YgdGhlIGRyaXZlcgo+YW5kIHdoZXRoZXIgdGhlcmUgd2FzIGEg
cmVhc29uIGZvciBkb2luZyB0aGluZ3MgbGlrZSB0aGlzLgo+QnV0IHRoZXJlIGFyZSB0b28gbWFu
eSB0aHJlYWRzIG9uIGxvcmUuCj4KPkkgdGhpbmsgdGhlIHByb3BlciBmaXggaXMgdG8ga2VlcCB0
aGUgSVJRIHJlcXVlc3RlZCBkdXJpbmcKPnN1c3BlbmQvcmVzdW1lIGFuZCAqbm90KiBtYXJrIGl0
IGFzIHdha2V1cC1zb3VyY2U7IGluIHRoZQo+ZGV2aWNlIHRyZWUgZm9yIHRoZSBTb0MuCj4KPlN1
cHBvcnQgY29kZSBpcyBuZWVkZWQgaW4gdGhlIGRyaXZlciwgc29tZXRoaW5nIGFsb25nIHRoZSBs
aW5lCj5vZiB0aGlzOgo+Cj5zdXNwZW5kKCk6Cj4gICAgICAgICAgICAgICAgaWYgKGRldmljZV9t
YXlfd2FrZXVwKGRldikpCj4gICAgICAgICAgICAgICAgICAgICAgICBlbmFibGVfaXJxX3dha2Uo
aXJxKTsKPgo+cmVzdW1lKCk6Cj4gICAgICAgICAgICAgICAgaWYgKGRldmljZV9tYXlfd2FrZXVw
KGRldikpCj4gICAgICAgICAgICAgICAgICAgICAgICBkaXNhYmxlX2lycV93YWtlKGlycSk7Cj4K
PkRvIHlvdSB3YW50IHRvIG1ha2UgdGhlIHBhdGNoIG9yIHNob3VsZCBJPwoKPgoKCkkgYWdyZWUg
dGhhdCB0aGUgcHJvcGVyIGZpeCBpcyB0byBrZWVwIHRoZSBJUlEgcmVxdWVzdGVkIGZvciB0aGUK
ZGV2aWNlIGxpZmV0aW1lIChyZXF1ZXN0IGluIHByb2JlLCBmcmVlIGluIHJlbW92ZSksIHJhdGhl
ciB0aGFuCnJlcXVlc3RpbmcgYW5kIGZyZWVpbmcgaXQgYXJvdW5kIHJ1bnRpbWUgc3VzcGVuZC9y
ZXN1bWUuIE15IHBhdGNoCm9ubHkgYWRkcmVzc2VkIHRoZSByZW1vdmUtdGltZSBsZWFrIG9uIHRv
cCBvZiB0aGUgY3VycmVudCBkZXNpZ24uCgoKSSBkbyBub3QgaGF2ZSBoYXJkd2FyZSB0byB2YWxp
ZGF0ZSBhIHByb3BlciByZXdvcmssIGluY2x1ZGluZyB0aGUKcG93ZXItdXAvSVJRIHJhY2UgSmFj
b3BvIG1lbnRpb25lZCwgc28gSSB3b3VsZCBwcmVmZXIgdG8gbGVhdmUgdGhhdApmdWxsZXIgcmV3
b3JrIHRvIHRoZSBtYWludGFpbmVycy4gUGxlYXNlIGZlZWwgZnJlZSB0byBkcm9wIG15IHBhdGNo
CmluIGZhdm91ciBvZiB0aGUgZnVsbGVyIGZpeC4KCgpUaGFua3MsCkxpIFlvdWhvbmcKCj5Zb3Vy
cywKPkxpbnVzIFdhbGxlaWoK
