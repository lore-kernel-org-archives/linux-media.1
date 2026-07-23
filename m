Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F017E3ED3C9;
	Thu, 23 Jul 2026 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784792576; cv=none; b=tbMb1HEunOZSqVL3ff9bFFuMFWOAtVp4RwPECvOauGQpMiccvawHXEVfhx2KuYtDs3pXRsdPLHmLuzppOTlWxXfpSYRHOeDch3V6K8XN6QraKaGSZy8mlquXNUCxGs770W9doCE0FK4MEvbdeG6qnk3mLwmuzYkIDgWd20VEVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784792576; c=relaxed/simple;
	bh=C/M5KFfUrgZMpHmta+HqW8Pse9Z/FsqexvNxgQYzemo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NRuHaEoBFHSDjoX1HnfPOOvYEjP3owqMcXuqn9HoobgcHuV8zxAB3bLbjfllqrZXiNkJtj1822MqwXpPzGoNiI3KMdQWpjtPo2qdHwM+QdszYGjPdnoc3HXkti0j+dWMVgFdkrtpT7kJqiaqc/Un3ObwhQrQEAZhZYckS1e6LC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=gKySStp/; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="gKySStp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C/M5KFfUrgZMpHmta+HqW8Pse9Z/FsqexvNxgQYzemo=;
  b=gKySStp/vpA9Iz/4ulew2/DTIIqLXIAUvyQbZnnIny5OCPY27EXaJ7Y8
   vyaOvvRgTrnlmvju7wGu2dyGbPoFbyFtQ9M2jDCzWkqcoNcd14w7MTAxx
   iS7gI7/BnZC2L83mK8sk4yf+CtF5sFyIKlyF8xuKySojykVerE1M0nfrU
   Bt0fQzeUXiyW7Jag1GZlzc6ADwp+bSt1m14TqUNh21oy2dpwoRgtw9wLZ
   JxBeXfZmaBCXzxVkPligJ55Hn7FEGHkhi2gqGcc26JGv9b2Kh6lULWDPq
   DuzblXTNitO2VZjQOLzoZPxlznq4MO2SbqsSHdq9NluIpQpWvPELKgcuk
   A==;
X-CSE-ConnectionGUID: L+9Bzb9bTVmY12BcJ9oj6Q==
X-CSE-MsgGUID: qBx7y54LSW2TSkacpphadA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 23 Jul 2026 15:42:50 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 66N7gnfW092136;
	Thu, 23 Jul 2026 15:42:49 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Jul 2026 15:42:48 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.037; Thu, 23 Jul 2026 15:42:48 +0800
From: <Hermes.Wu@ite.com.tw>
To: <krzk@kernel.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Thread-Topic: [PATCH v7 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Thread-Index: AQHdGnLR8NELzo76lUG008osKsC1j7Z6uLBw
Date: Thu, 23 Jul 2026 07:42:48 +0000
Message-ID: <ba2c3431e96a45f5a34d37c695b89b37@ite.com.tw>
References: <20260723-upstream-it6625-it6626-v7-0-f8175bb0ea12@ite.com.tw>
 <20260723-upstream-it6625-it6626-v7-1-f8175bb0ea12@ite.com.tw>
 <73c13a05-a10f-4aee-8b05-ac925b7fe729@kernel.org>
In-Reply-To: <73c13a05-a10f-4aee-8b05-ac925b7fe729@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 21D77D47E8CCF073A58A26089D81D2FD79A6B66043397A491ED11453F0DEFF902002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 66N7gnfW092136

SGkgS3J6eXN6dG9mLA0KDQo+DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IA0KPlNlbnQ6IFRodXJzZGF5LCBK
dWx5IDIzLCAyMDI2IDM6MTQgUE0NCj5UbzogSGVybWVzIFd1ICjlkLPkvbPlro8pIDxIZXJtZXMu
V3VAaXRlLmNvbS50dz47IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3Jn
PjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGty
emsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4NCj5D
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcg
MS8yXSBkdC1iaW5kaW5nczogbWVkaWE6IGFkZCBJVEUgSVQ2NjI1L0lUNjYyNiBIRE1JIGJyaWRn
ZSBiaW5kaW5nDQo+DQo+T24gMjMvMDcvMjAyNiAwNDo0NCwgSGVybWVzIFd1IHZpYSBCNCBSZWxh
eSB3cm90ZToNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgZW51
bToNCj4+ICsgICAgICAtIGl0ZSxpdDY2MjUNCj4+ICsgICAgICAtIGl0ZSxpdDY2MjYNCj4+ICsN
Cj4+ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgIHJlc2V0LWdwaW9z
Og0KPj4gKyAgICBkZXNjcmlwdGlvbjoNCj4+ICsgICAgICBHUElPIGNvbm5lY3RlZCB0byB0aGUg
YWN0aXZlLWxvdyByZXNldCBsaW5lLg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKw0KPg0KPkFs
c28sIGhvdyBkb2VzIHRoaXMgZGV2aWNlIHdvcmsgd2l0aG91dCBhbnkgcG93ZXIgc3VwcGxpZWQ/
DQoNClBvd2VyIHN1cHBseSBhbmQgaW50ZXJydXB0IHdpbGwgYWRkIGluIHRoZSBuZXh0IHBhdGNo
Lg0KDQpUaGFua3MuDQoNCj5CZXN0IHJlZ2FyZHMsDQo+S3J6eXN6dG9mDQo+DQo=
