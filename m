Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B443CF685;
	Mon, 27 Jul 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133507; cv=none; b=gOddpadq0hlO2lRNUP3YwtVqZCkWp03PcrHg3dJESN4oUYSSuz8zcRfG7SVPUgZtMyOD5bNzz2XZjBf0Ro1x0LDuOmZsv5cdswdxx6EkjaWV/jB2Vzj2JvgqbQae0KDhzSGLfJW+JQmF9qmGw+4P300tTiTcdXwzkXf8k+eRtZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133507; c=relaxed/simple;
	bh=Wc4SSX9HsC4MLzG7eQbA/CYfaNGb6lRgLHSStlwTWFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pq+9V3pTJnKa+eSF3lNWo+Fe4pcwyQMtwUUcjoRiUiTTwPNGNRPFb8coFO4lsukg/B+6v6/m60bbW80WrEorZkvj0fu1TKx7ifk1lMoCdB3Zop1ts3ghvf4dh1VrJ5IGTkvYLjbvnJNI0ex2M1GRn2aIz3dkL3cF1lwz05dCJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=bQc0ntfL; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="bQc0ntfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wc4SSX9HsC4MLzG7eQbA/CYfaNGb6lRgLHSStlwTWFw=;
  b=bQc0ntfLN2I0++/S3HtKC8aWyo4SPjjZchqbnVnQHyqKGseH/B8Rbl5U
   OWWsZ63D7BIK+nbeaoVVgp0EBn0zEAQXb/0hz5FZthNLtV22ixJ4CRlAv
   fb4FEuSnHfNPECdMBCBbtC/zyQNfmoWYe8jfSkzH7OhU0MDnDN6/9hMnD
   vvhHIejrJsoc/lGW0Ski4hALYB1e+2u53Bv8TE/AnRkJ44YWA+wjDCgIg
   +XwTVLZbCt6cgThnViKSbUYQ8btFlrysyp6nHYFbSeEGRNHdXi/IfyYN6
   5XhaDnYh9WUbJo7QX336/de0teAMhGy9B/vW7BFT5JhTod+liwd+F2YaB
   A==;
X-CSE-ConnectionGUID: z/NgeMbuR+qMjHmwvqHaxA==
X-CSE-MsgGUID: 3TLI7qnYTGiX0QrUWp52Bg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 27 Jul 2026 14:24:51 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 66R6Ok1X099211;
	Mon, 27 Jul 2026 14:24:46 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Jul 2026 14:24:45 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.037; Mon, 27 Jul 2026 14:24:45 +0800
From: <Hermes.Wu@ite.com.tw>
To: <krzk@kernel.org>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v8 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge
Thread-Topic: [PATCH v8 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge
Thread-Index: AQHdHY/iZBSRDX0JxUaycnwSDZdi0raA5YuQ
Date: Mon, 27 Jul 2026 06:24:45 +0000
Message-ID: <87eaffcb47b24d9fb48fdca8d5309728@ite.com.tw>
References: <20260727-upstream-it6625-it6626-v8-0-2c3b0f9524fc@ite.com.tw>
 <20260727-upstream-it6625-it6626-v8-1-2c3b0f9524fc@ite.com.tw>
 <20260727-brawny-tested-puffin-febfc3@quoll>
In-Reply-To: <20260727-brawny-tested-puffin-febfc3@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 0F2B42C9D733B479CE33CD4167FAB30AF2FF49430B003CC17DF227AAA4AF198E2002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 66R6Ok1X099211

SGkga3J6eXN6dG9mLA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IA0KPlNlbnQ6IE1vbmRheSwgSnVseSAy
NywgMjAyNiAyOjE5IFBNDQo+VG86IEhlcm1lcyBXdSAo5ZCz5L2z5a6PKSA8SGVybWVzLld1QGl0
ZS5jb20udHc+DQo+Q2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3Jn
PjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGty
emsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHY4IDEvMl0g
ZHQtYmluZGluZ3M6IG1lZGlhOiBhZGQgSVRFIElUNjYyNS9JVDY2MjYgSERNSSBicmlkZ2UNCj4N
Cj5PbiBNb24sIEp1bCAyNywgMjAyNiBhdCAxMDoyODo0MUFNICswODAwLCBIZXJtZXMgV3Ugd3Jv
dGU6DQo+PiBEb2N1bWVudCB0aGUgZGV2aWNldHJlZSBiaW5kaW5nIGZvciB0aGUgSVRFIElUNjYy
NS9JVDY2MjYgSERNSSB0byBNSVBJIA0KPj4gQ1NJLTIgYnJpZGdlLiBUaGUgZGV2aWNlIGV4cG9z
ZXMgdHdvIGdyYXBoIHBvcnRzOiBwb3J0QDANCj4+IChNSVBJMCkgYW5kIHBvcnRAMSAoTUlQSTEp
LCB0aGUgdHdvIHNlbGVjdGFibGUgQ1NJLTIgRC1QSFkvQy1QSFkgDQo+PiBvdXRwdXRzLiBPbmx5
IHBvcnRAMCBpcyByZXF1aXJlZCwgc2luY2UgYSBib2FyZCBvbmx5IG5lZWRzIHRvIHdpcmUgdXAg
DQo+PiBhcyBtYW55IG9mIHRoZSBicmlkZ2UncyBvdXRwdXRzIGFzIGl0IGFjdHVhbGx5IHVzZXMu
DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEhlcm1lcyBXdSA8SGVybWVzLnd1QGl0ZS5jb20udHc+
DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gdjg6DQo+DQo+UmV2aWV3ZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4NCg0KVGhh
bmtzIGZvciB5b3VyIHJldmlldy4NCg0KPkJlc3QgcmVnYXJkcywNCj5Lcnp5c3p0b2YNCj4NClJl
Z2FyZHMsDQpIZXJtZXMNCg==
